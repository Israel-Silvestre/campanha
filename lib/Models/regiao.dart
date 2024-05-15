import 'lideranca.dart';

class Regiao {
  final String nome;
  final List<Lideranca> liderancas;
  final int votos;
  final int demandas;
  final int pendencias;
  final String imageUrl;

  Regiao({
    required this.nome,
    required this.liderancas,
    required this.votos,
    required this.demandas,
    required this.pendencias,
    required this.imageUrl,
  });


  void adicionarLideranca(Lideranca lideranca) {
    liderancas.add(lideranca);
  }

  void removeLideranca(Lideranca lideranca) {
    liderancas.remove(lideranca);
  }
}
