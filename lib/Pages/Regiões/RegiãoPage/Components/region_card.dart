import 'package:flutter/material.dart';
import '../../../../Models/regiao.dart';

class RegiaoCard extends StatelessWidget {
  final Regiao regiao;
  final int liderancaCount; // Número de lideranças
  final VoidCallback onTap; // Callback para o clique

  RegiaoCard({required this.regiao, required this.liderancaCount, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Define a função a ser chamada no clique
      child: Card(
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
            Image.network(
              regiao.imageURL,
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
                  Text('Lideranças: $liderancaCount', style: TextStyle(fontSize: 14)), // Mostra a contagem de lideranças
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
