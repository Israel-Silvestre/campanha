import 'package:campanha/Persist%C3%AAncia/regi%C3%A3o_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Models/lideranca.dart';

class LiderancaService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _liderancasCollection = FirebaseFirestore.instance.collection('Lideranças');
  final RegiaoService _regiaoService = RegiaoService();

  // Método para adicionar uma nova liderança
  Future<void> addLideranca(Lideranca lideranca) async {
    try {
      await _liderancasCollection.add(lideranca.toMap());
    } catch (e) {
      print('Erro ao adicionar liderança: $e');
    }
  }

  // Método para atualizar uma liderança existente
  Future<void> updateLideranca(int id, Lideranca lideranca) async {
    try {
      await _liderancasCollection.doc(id.toString()).update(lideranca.toMap());
    } catch (e) {
      print('Erro ao atualizar liderança: $e');
    }
  }

  // Método para deletar uma liderança
  Future<void> deleteLideranca(int id) async {
    try {
      await _liderancasCollection.doc(id.toString()).delete();
    } catch (e) {
      print('Erro ao deletar liderança: $e');
    }
  }

  // Método para obter uma liderança específica pelo ID
  Future<Lideranca?> getLiderancaById(int id) async {
    try {
      DocumentSnapshot doc = await _liderancasCollection.doc(id.toString()).get();
      if (doc.exists) {
        return Lideranca.fromMap(doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print('Erro ao obter liderança: $e');
    }
    return null;
  }

  // Método para obter todas as lideranças
  Future<List<Lideranca>> getAllLiderancas() async {
    try {
      QuerySnapshot querySnapshot = await _liderancasCollection.get();
      List<Lideranca> liderancas = [];
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        // Obter o nome da região pelo regiaoId
        String? nomeRegiao = await _regiaoService.getRegiaoNameById(doc['regiaoId']);
        if (nomeRegiao != null) {
          // Criar a liderança apenas se o nome da região for obtido com sucesso
          Lideranca lideranca = Lideranca.fromMap(doc.data() as Map<String, dynamic>);
          lideranca.nomeRegiao = nomeRegiao;
          liderancas.add(lideranca);
        } else {
          print('Erro ao obter o nome da região para a liderança com ID: ${doc.id}');
        }
      }
      return liderancas;
    } catch (e) {
      print('Erro ao obter todas as lideranças: $e');
      return [];
    }
  }
}
