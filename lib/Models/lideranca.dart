class Lideranca {
  String id;
  String nome;
  String fotoAsset;
  int votos;
  String regiaoId; // Alterado para armazenar apenas o ID da região
  String nomeRegiao; // Nome da região

  int demandas;
  int pendencias;
  String telefone;

  Lideranca({
    required this.id,
    required this.nome,
    required this.fotoAsset,
    required this.votos,
    required this.regiaoId,
    required this.nomeRegiao,
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
      regiaoId: map['regiaoId'], // Alteração: Adicionar regiaoId
      nomeRegiao: '', // Inicializa o nome da região como vazio
      demandas: map['demandas'],
      pendencias: map['pendencias'],
      telefone: map['telefone'],
    );
  }

  // Método para converter uma instância de Lideranca em um mapa
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'fotoAsset': fotoAsset,
      'votos': votos,
      'regiaoId': regiaoId, // Alteração: Adicionar regiaoId
      'demandas': demandas,
      'pendencias': pendencias,
      'telefone': telefone,
    };
  }
}

