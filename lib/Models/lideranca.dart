import 'regiao.dart';

class Lideranca {
  final String id;
  final String nome;
  final String fotoAsset;
  final int votos;
  final Regiao regiao;
  final int demandas;
  final int pendencias;
  final String telefone;

  Lideranca({
    required this.id,
    required this.nome,
    required this.fotoAsset,
    required this.votos,
    required this.regiao,
    required this.demandas,
    required this.pendencias,
    required this.telefone,
  });

  // Converte de Map para um objeto Lideranca
  factory Lideranca.fromMap(Map<String, dynamic> map) {
    return Lideranca(
      id: map['id'],
      nome: map['nome'],
      fotoAsset: map['fotoAsset'],
      votos: map['votos'],
      regiao: map['regiao'], // Não é necessário chamar toMap() aqui
      demandas: map['demandas'],
      pendencias: map['pendencias'],
      telefone: map['telefone'],
    );
  }

  // Converte de um objeto Lideranca para Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'fotoAsset': fotoAsset,
      'votos': votos,
      'regiao': regiao.id, // Apenas o ID da região é necessário aqui
      'demandas': demandas,
      'pendencias': pendencias,
      'telefone': telefone,
    };
  }
}
