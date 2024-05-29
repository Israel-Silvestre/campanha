import 'lideranca.dart';

class Regiao {
  String id;
  String nome;
  List<Lideranca> liderancas;
  int votos;
  int demandas;
  int pendencias;
  String imageUrl;

  Regiao({
    required this.id,
    required this.nome,
    required this.liderancas,
    required this.votos,
    required this.demandas,
    required this.pendencias,
    required this.imageUrl,
  });

  // Método para converter um Map em uma instância de Regiao
  factory Regiao.fromMap(Map<String, dynamic> map) {
    return Regiao(
      id: map['id'],
      nome: map['nome'], // Adicione essa linha para definir o nome da região a partir do Map
      liderancas: (map['liderancas'] as List).map((item) => Lideranca.fromMap(item)).toList(),
      votos: map['votos'],
      demandas: map['demandas'],
      pendencias: map['pendencias'],
      imageUrl: map['imageUrl'],
    );
  }

  // Método para converter uma instância de Regiao em um Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome, // Adicione essa linha para incluir o nome da região no Map
      'liderancas': liderancas.map((lideranca) => lideranca.toMap()).toList(),
      'votos': votos,
      'demandas': demandas,
      'pendencias': pendencias,
      'imageUrl': imageUrl,
    };
  }
}
