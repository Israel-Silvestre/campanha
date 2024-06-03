import 'package:flutter/material.dart';
import '../../../Models/lideranca.dart';
import '../../../Persistência/lideranca_service.dart';
import '../Lideranças_create/lideranca_create.dart';
import 'Components/search_bar.dart';
import '../Lideranças_Info/liderancas_info_page.dart';
import 'Components/lider_card.dart';

class LeaderManagementPage extends StatefulWidget {
  @override
  _LeaderManagementPageState createState() => _LeaderManagementPageState();
}

class _LeaderManagementPageState extends State<LeaderManagementPage> {
  final LiderancaService _liderancaService = LiderancaService(); // Instância do serviço de lideranças
  bool _showSearchBar = true;
  List<Lideranca> liderancas = []; // Lista de lideranças

  @override
  void initState() {
    super.initState();
    _loadLiderancas(); // Carrega as lideranças ao iniciar a página
  }

  Future<void> _loadLiderancas() async {
    try {
      List<Lideranca> liderancasFromDB = (await _liderancaService.getAllLiderancas()).cast<Lideranca>(); // Busca todas as lideranças do banco
      setState(() {
        liderancas = liderancasFromDB; // Atualiza a lista de lideranças no estado da página
      });
    } catch (e) {
      print('Erro ao carregar lideranças: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification is ScrollUpdateNotification) {
          if (scrollNotification.scrollDelta! < 0 && !_showSearchBar) {
            setState(() {
              _showSearchBar = true;
            });
          } else if (scrollNotification.scrollDelta! > 0 && _showSearchBar) {
            setState(() {
              _showSearchBar = false;
            });
          }
        }
        return false;
      },
      child: Stack(
        children: [
          ListView.builder(
            itemCount: liderancas.length + 1, // Adicionando 1 para o SizedBox
            itemBuilder: (context, index) {
              if (index == 0) {
                // Renderizando SizedBox antes do primeiro item
                return SizedBox(height: 30.0); // Defina a altura desejada aqui
              } else {
                // Renderizando os itens da lista
                final lideranca = liderancas[index - 1];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LiderCard(
                    lideranca: lideranca,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LiderancaPage(lideranca: lideranca),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
          if (_showSearchBar)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SearchBar1(liderancas: liderancas), // ou qualquer widget que você deseja mostrar
            ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: FloatingActionButton(
              onPressed: () {
                // Implementar navegação para a tela de criar lideranças
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddLiderancaPage(), // Substitua por sua tela de criação
                  ),
                );
              },
              backgroundColor: Colors.yellowAccent,
              child: Icon(Icons.add, color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
