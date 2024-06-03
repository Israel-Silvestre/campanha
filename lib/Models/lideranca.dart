class Lideranca {
  int id;
  String nome;
  String fotoAsset;
  int votos;
  int regiaoId;
  String nomeRegiao;
  int demandas;
  int pendencias;
  String telefone;

  Lideranca({
    required this.id,
    required this.nome,
    required this.fotoAsset,
    required this.votos,
    required this.regiaoId,
    this.nomeRegiao = '',
    required this.demandas,
    required this.pendencias,
    required this.telefone,
  });

  factory Lideranca.fromMap(Map<String, dynamic> map) {
    return Lideranca(
      id: map['id'],
      nome: map['nome'],
      fotoAsset: map['fotoAsset'],
      votos: map['votos'],
      regiaoId: map['regiaoId'],
      nomeRegiao: map['nomeRegiao'] ?? '',
      demandas: map['demandas'],
      pendencias: map['pendencias'],
      telefone: map['telefone'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'fotoAsset': fotoAsset,
      'votos': votos,
      'regiaoId': regiaoId,
      'nomeRegiao': nomeRegiao,
      'demandas': demandas,
      'pendencias': pendencias,
      'telefone': telefone,
    };
  }
}
