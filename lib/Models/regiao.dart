import 'package:cloud_firestore/cloud_firestore.dart';

class Regiao {
  String id;
  String nome;
  String imageURL;
  int demandas;
  int pendencias;
  int votos;

  Regiao({
    required this.id,
    required this.nome,
    required this.imageURL,
    required this.demandas,
    required this.pendencias,
    required this.votos,
  });

  // Factory method to create a Regiao object from a Firestore document
  factory Regiao.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;

    if (data != null) {
      return Regiao(
        id: data['id'].toString(),  // Assuming 'id' is a number and converting it to a string
        nome: data['nome'] ?? '', // Tratamento para valor nulo
        imageURL: data['imageURL'] ?? '', // Tratamento para valor nulo
        demandas: data['demandas'] ?? 0, // Tratamento para valor nulo
        pendencias: data['pendencias'] ?? 0, // Tratamento para valor nulo
        votos: data['votos'] ?? 0, // Tratamento para valor nulo
      );
    } else {
      throw Exception("Documento não contém dados.");
    }
  }

  // Method to convert a Regiao object to a Firestore document
  Map<String, dynamic> toFirestore() {
    return {
      'id': int.parse(id),
      'nome': nome,
      'imageURL': imageURL,
      'demandas': demandas,
      'pendencias': pendencias,
      'votos': votos,
    };
  }
}
