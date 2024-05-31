import 'package:flutter/material.dart';

import '../../../../Models/regiao.dart';

class RegiaoCard extends StatelessWidget {
  final Regiao regiao;

  RegiaoCard({required this.regiao});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 250,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            ),
            padding: EdgeInsets.all(15),
            child: Center(
              child: Text(
                regiao.nome.toUpperCase(),
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
          Image.network( // Alterado de Image.asset para Image.network
            regiao.imageURL, // Corrigido de imageUrl para imageURL
            width: 250,
            height: 150,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Votos: ${regiao.votos}', style: TextStyle(fontSize: 14)),
                Text('Demandas: ${regiao.demandas}', style: TextStyle(fontSize: 14)),
                Text('Pendências: ${regiao.pendencias}', style: TextStyle(fontSize: 14)),
                Text('Lideranças: ${regiao.liderancaIds.length}', style: TextStyle(fontSize: 14)), // Corrigido de regiao.li para regiao.liderancaIds.length
              ],
            ),
          ),
        ],
      ),
    );
  }
}
