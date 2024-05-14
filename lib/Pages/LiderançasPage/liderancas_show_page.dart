import 'package:flutter/material.dart';

import '../../Models/lideranca.dart';
import 'Components/lider_card.dart';

class LeaderManagementPage extends StatelessWidget {
  final ScrollController scrollController;

  LeaderManagementPage({required this.scrollController});

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
        nome: 'Líder 2',
        fotoAsset: 'assets/img.png',
        votos: 124,
        regiao: 'Iraque',
        demandas: 6,
        pendencias: 11,
      ),
      Lideranca(
        nome: 'Líder 2',
        fotoAsset: 'assets/img.png',
        votos: 124,
        regiao: 'Iraque',
        demandas: 6,
        pendencias: 11,
      ),
      Lideranca(
        nome: 'Líder 2',
        fotoAsset: 'assets/img.png',
        votos: 124,
        regiao: 'Iraque',
        demandas: 6,
        pendencias: 11,
      ),
      Lideranca(
        nome: 'Líder 2',
        fotoAsset: 'assets/img.png',
        votos: 124,
        regiao: 'Iraque',
        demandas: 6,
        pendencias: 11,
      ),
    ];

    return ListView.builder(
      controller: scrollController,
      itemCount: liderancas.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: LiderCard(
            lideranca: liderancas[index],
          ),
        );
      },
    );
  }
}
