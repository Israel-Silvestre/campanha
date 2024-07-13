import 'package:flutter/material.dart';
import '../../../Models/lideranca.dart';
import '../Lideranças_edit/edit_liderancas.dart';
import '../../../Persistência/lideranca_service.dart'; // Adicionando a importação do serviço

class LiderancaPage extends StatelessWidget {
  final Lideranca lideranca;
  final LiderancaService _liderancaService = LiderancaService(); // Instância do serviço de lideranças

  LiderancaPage({required this.lideranca});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Liderança ${lideranca.nome}',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert, color: Colors.white),
            onSelected: (String value) {
              if (value == 'Editar Liderança') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditLiderancaPage(lideranca: lideranca),
                  ),
                );
              } else if (value == 'Remover Liderança') {
                // Chama a função de remoção de liderança
                _removerLideranca(context, lideranca);
              }
            },
            itemBuilder: (BuildContext context) {
              return {'Editar Liderança', 'Remover Liderança'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with image and name
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    lideranca.fotoAsset,
                    width: 72,  // 3x4 photo aspect ratio
                    height: 96, // 3x4 photo aspect ratio
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.broken_image,
                        size: 96,
                      );
                    },
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lideranca.nome,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Região: ${lideranca.nomeRegiao}',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Votos: ${lideranca.votos}',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.0),
            // Demands
            Text(
              'Demandas:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              lideranca.demandas.toString(),
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 24.0),
            // Pendências
            Text(
              'Pendências:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              lideranca.pendencias.toString(),
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _removerLideranca(BuildContext context, Lideranca lideranca) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Remover Liderança'),
          content: Text('Tem certeza de que deseja remover esta liderança?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                try {
                  // Chama o método deleteLideranca do serviço
                  await _liderancaService.deleteLideranca(lideranca.id, lideranca.fotoAsset);

                  Navigator.of(context).pop();
                  Navigator.of(context).pop(true); // Voltar para a tela anterior após a remoção
                } catch (e) {
                  print('Erro ao remover liderança: $e');
                  Navigator.of(context).pop(false); // Manter o diálogo aberto em caso de erro
                }
              },
              child: Text('Remover'),
            ),
          ],
        );
      },
    ).then((value) {
      if (value == true) {
        // Atualiza a lista de lideranças na tela anterior após a remoção
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Liderança removida com sucesso!')),
        );
      }
    });
  }
}
