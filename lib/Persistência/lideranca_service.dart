import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/lideranca.dart';

class LiderancaService {
  final CollectionReference leadersCollection = FirebaseFirestore.instance.collection('leaders');
  final CollectionReference regionsCollection = FirebaseFirestore.instance.collection('regions');

  Future<void> addLeader(Lideranca lideranca) async {
    try {
      await leadersCollection.doc(lideranca.id).set(lideranca.toMap());
      print('Liderança adicionada com sucesso.');
    } catch (e) {
      print('Erro ao adicionar liderança: $e');
    }
  }

  Future<Lideranca?> getLeader(String id) async {
    try {
      DocumentSnapshot doc = await leadersCollection.doc(id).get();
      if (doc.exists) {
        return Lideranca.fromMap(doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print('Erro ao obter liderança: $e');
    }
    return null;
  }

  Future<List<Lideranca>> getAllLiderancas() async {
    try {
      QuerySnapshot querySnapshot = await leadersCollection.get();
      List<Lideranca> liderancas = [];
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        Lideranca lideranca = Lideranca.fromMap(doc.data() as Map<String, dynamic>);
        // Buscar o nome da região correspondente à liderança
        String regiaoId = lideranca.regiaoId;
        DocumentSnapshot regionDoc = await regionsCollection.doc(regiaoId).get();
        String nomeRegiao = regionDoc.get('nome');
        liderancas.add(lideranca);
      }
      return liderancas;
    } catch (e) {
      print('Erro ao obter todas as lideranças: $e');
      return [];
    }
  }

  Future<void> updateLeader(Lideranca lideranca) async {
    try {
      await leadersCollection.doc(lideranca.id).update(lideranca.toMap());
      print('Liderança atualizada com sucesso.');
    } catch (e) {
      print('Erro ao atualizar liderança: $e');
    }
  }

  Future<void> deleteLeader(String id) async {
    try {
      await leadersCollection.doc(id).delete();
      print('Liderança excluída com sucesso.');
    } catch (e) {
      print('Erro ao excluir liderança: $e');
    }
  }
}
