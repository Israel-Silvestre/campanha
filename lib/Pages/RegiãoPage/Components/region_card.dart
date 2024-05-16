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
            width: 250, // Aumente a largura do card
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            ),
            padding: EdgeInsets.all(15), // Aumente o padding para um visual mais espaçoso
            child: Center(
              child: Text(
                regiao.nome.toUpperCase(),
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16), // Aumente o tamanho do texto
              ),
            ),
          ),
          Image.asset(
            regiao.imageUrl,
            width: 250, // Ajuste a largura da imagem
            height: 150, // Ajuste a altura da imagem
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0), // Aumente o padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Votos: ${regiao.votos}', style: TextStyle(fontSize: 14)), // Aumente o tamanho do texto
                Text('Demandas: ${regiao.demandas}', style: TextStyle(fontSize: 14)), // Aumente o tamanho do texto
                Text('Pendências: ${regiao.pendencias}', style: TextStyle(fontSize: 14)), // Aumente o tamanho do texto
                Text('Lideranças: ${regiao.liderancas.length}', style: TextStyle(fontSize: 14)), // Aumente o tamanho do texto
              ],
            ),
          ),
        ],
      ),
    );
  }
}
