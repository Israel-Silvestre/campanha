import 'package:flutter/material.dart';
import '../../../../Models/demanda.dart';

class DemandaCard extends StatelessWidget {
  final Demanda demanda;

  DemandaCard({
    required this.demanda,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              demanda.fotoAsset,
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              demanda.titulo,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              demanda.descricao,
              style: TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                'R\$ ${demanda.custo.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
