import 'package:cloud_firestore/cloud_firestore.dart';

class Demanda {
  final String id;
  final String titulo;
  final String descricao;
  final String estado;
  final String fotoAsset;
  final int custo;
  final String liderancaId;
  final int regiaoId;

  Demanda({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.estado,
    required this.fotoAsset,
    required this.custo,
    required this.liderancaId,
    required this.regiaoId,
  });

  // Método para converter um documento Firestore em um objeto Demanda
  factory Demanda.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return Demanda(
      id: data['id'] ?? '',
      titulo: data['titulo'] ?? '',
      descricao: data['descrição'] ?? '',
      estado: data['estado'] ?? '',
      fotoAsset: data['fotoAsset'] ?? '',
      custo: data['custo'] ?? 0,
      liderancaId: data['liderancaId'] ?? '',
      regiaoId: data['regiaoId'] ?? 0,
    );
  }

  // Método para converter um objeto Demanda em um mapa de dados Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'titulo': titulo,
      'descricao': descricao,
      'estado': estado,
      'fotoAsset': fotoAsset,
      'custo': custo,
      'liderancaId': liderancaId,
      'regiaoId': regiaoId,
    };
  }
}
