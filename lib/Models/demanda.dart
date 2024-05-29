enum EstadoDemanda {
  recebida,
  emAndamento,
  urgente,
  resolvida,
}

class Demanda {
  final String id;
  final String titulo;
  final String descricao;
  final String regiaoId;
  final String liderancaId;
  final EstadoDemanda estado;
  final double custo;
  final String fotoAsset;

  Demanda({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.regiaoId,
    required this.liderancaId,
    required this.estado,
    required this.custo,
    required this.fotoAsset,
  });

  factory Demanda.fromMap(Map<String, dynamic> map) {
    return Demanda(
      id: map['id'],
      titulo: map['titulo'],
      descricao: map['descricao'],
      regiaoId: map['regiaoId'],
      liderancaId: map['liderancaId'],
      estado: EstadoDemanda.values[map['estado']],
      custo: map['custo'],
      fotoAsset: map['fotoAsset'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'descricao': descricao,
      'regiaoId': regiaoId,
      'liderancaId': liderancaId,
      'estado': estado.index,
      'custo': custo,
      'fotoAsset': fotoAsset,
    };
  }
}
