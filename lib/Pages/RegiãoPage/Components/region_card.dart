import 'package:flutter/material.dart';

import '../../../Models/regiao.dart';

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
            width: 200,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            ),
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                regiao.nome.toUpperCase(),
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Image.asset(
            regiao.imageUrl,
            width: 200,
            height: 100,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Votos: ${regiao.votos}', style: TextStyle(fontSize: 12)),
                Text('Demandas: ${regiao.demandas}', style: TextStyle(fontSize: 12)),
                Text('Pendências: ${regiao.pendencias}', style: TextStyle(fontSize: 12)),
                Text('Lideranças: ${regiao.liderancas.length}', style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
