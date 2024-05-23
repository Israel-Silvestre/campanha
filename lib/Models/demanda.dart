import 'regiao.dart';
import 'lideranca.dart';

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
  final Regiao regiao;
  final Lideranca lideranca;
  final EstadoDemanda estado;

  Demanda({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.regiao,
    required this.lideranca,
    required this.estado,
  });
}
