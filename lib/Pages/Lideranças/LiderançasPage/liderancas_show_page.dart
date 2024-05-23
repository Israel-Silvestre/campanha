import 'package:flutter/material.dart';
import '../../../Models/lideranca.dart';
import '../../../Models/regiao.dart';
import 'Components/search_bar.dart';
import '../Lideranças_Info/liderancas_info_page.dart';
import 'Components/lider_card.dart';

class LeaderManagementPage extends StatefulWidget {
  @override
  _LeaderManagementPageState createState() => _LeaderManagementPageState();
}

class _LeaderManagementPageState extends State<LeaderManagementPage> {
  bool _showSearchBar = true;

  @override
  Widget build(BuildContext context) {
    // Criando instância da região para associar às lideranças
    Regiao regiao1 = Regiao(
      nome: 'Moinho dos Ventos',
      liderancas: [],
      votos: 100,
      demandas: 10,
      pendencias: 5,
      imageUrl: 'assets/region.png',
      id: '1',
    );

    // Criando lideranças e associando-as à região criada
    List<Lideranca> liderancas = [
      Lideranca(
        nome: 'Líder 1',
        fotoAsset: 'assets/img.png',
        votos: 789,
        regiao: regiao1,
        demandas: 8,
        pendencias: 2,
        id: '1',
        telefone: '123',
      ),
      Lideranca(
        nome: 'Líder 2',
        fotoAsset: 'assets/img.png',
        votos: 789,
        regiao: regiao1,
        demandas: 8,
        pendencias: 2,
        id: '2',
        telefone: '123',
      ),
      Lideranca(
        nome: 'Líder 3',
        fotoAsset: 'assets/img.png',
        votos: 789,
        regiao: regiao1,
        demandas: 8,
        pendencias: 2,
        id: '3',
        telefone: '123',
      ),
    ];

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
        ],
      ),
    );
  }
}
