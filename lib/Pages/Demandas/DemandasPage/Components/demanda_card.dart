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
            child: Image.network(
              demanda.fotoAsset,
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                        : null,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.broken_image,
                  size: 150,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              demanda.titulo,
              style: TextStyle(fontSize: 20),
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
