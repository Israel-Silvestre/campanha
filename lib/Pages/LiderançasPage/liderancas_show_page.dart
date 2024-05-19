import 'package:flutter/material.dart';
import '../../Models/lideranca.dart';
import '../HomePage/Components/search_bar.dart';
import 'Components/lider_card.dart';

class LeaderManagementPage extends StatefulWidget {
  @override
  _LeaderManagementPageState createState() => _LeaderManagementPageState();
}

class _LeaderManagementPageState extends State<LeaderManagementPage> {
  bool _showSearchBar = true;

  @override
  Widget build(BuildContext context) {
    List<Lideranca> liderancas = [
      Lideranca(
        nome: 'Líder 1',
        fotoAsset: 'assets/img.png',
        votos: 123,
        regiao: 'Iraque',
        demandas: 5,
        pendencias: 12,
      ),
      Lideranca(
        nome: 'Líder 1',
        fotoAsset: 'assets/img.png',
        votos: 123,
        regiao: 'Iraque',
        demandas: 5,
        pendencias: 12,
      ),

      Lideranca(
        nome: 'Líder 1',
        fotoAsset: 'assets/img.png',
        votos: 123,
        regiao: 'Iraque',
        demandas: 5,
        pendencias: 12,
      ),

      Lideranca(
        nome: 'Líder 1',
        fotoAsset: 'assets/img.png',
        votos: 123,
        regiao: 'Iraque',
        demandas: 5,
        pendencias: 12,
      ),

      Lideranca(
        nome: 'Líder 1',
        fotoAsset: 'assets/img.png',
        votos: 123,
        regiao: 'Iraque',
        demandas: 5,
        pendencias: 12,
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
              child: SearchBar1(), // ou qualquer widget que você deseja mostrar
            ),
        ],
      ),
    );
  }
}
