import 'lideranca.dart';

class Regiao {
  final String id;
  final String nome;
  final List<Lideranca> liderancas;
  final int votos;
  final int demandas;
  final int pendencias;
  final String imageUrl;

  Regiao({
    required this.id,
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

  void removerLideranca(Lideranca lideranca) {
    liderancas.remove(lideranca);
  }

  bool liderancaExiste(Lideranca lideranca) {
    return liderancas.contains(lideranca);
  }

  int contarDemandas() {
    int totalDemandas = 0;
    for (var lideranca in liderancas) {
      totalDemandas += lideranca.demandas;
    }
    return totalDemandas;
  }

  int contarPendencias() {
    int totalPendencias = 0;
    for (var lideranca in liderancas) {
      totalPendencias += lideranca.pendencias;
    }
    return totalPendencias;
  }

  int contarVotos() {
    int totalVotos = 0;
    for (var lideranca in liderancas) {
      totalVotos += lideranca.votos;
    }
    return totalVotos;
  }
}
