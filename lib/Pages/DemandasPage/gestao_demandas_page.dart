import 'package:flutter/material.dart';

import 'Components/demanda_card.dart';

class GestaoDemandasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Exemplo de demandas
    final demandas = [
      {
        'imageUrl': 'assets/region.png',
        'descricao': 'Demanda 1 - Descrição detalhada da demanda',
        'valor': 1500.00,
      },
      {
        'imageUrl': 'assets/centro.png',
        'descricao': 'Demanda 2 - Descrição detalhada da demanda',
        'valor': 2500.00,
      },
      {
        'imageUrl': 'assets/vila.png',
        'descricao': 'Demanda 3 - Descrição detalhada da demanda',
        'valor': 3500.00,
      },
    ];

    return ListView.builder(
      padding: EdgeInsets.all(10.0),
      itemCount: demandas.length,
      itemBuilder: (context, index) {
        final demanda = demandas[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: DemandaCard(
            imageUrl: demanda['imageUrl'] as String,
            descricao: demanda['descricao'] as String,
            valor: demanda['valor'] as double,
          ),
        );
      },
    );
  }
}
