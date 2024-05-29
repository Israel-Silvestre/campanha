import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/regiao.dart';

class RegiaoService {
  final CollectionReference regionsCollection = FirebaseFirestore.instance.collection('regions');

  Future<void> addRegion(Regiao regiao) async {
    try {
      await regionsCollection.doc(regiao.id).set(regiao.toMap());
      print('Região adicionada com sucesso.');
    } catch (e) {
      print('Erro ao adicionar região: $e');
    }
  }

  Future<Regiao?> getRegion(String id) async {
    try {
      DocumentSnapshot doc = await regionsCollection.doc(id).get();
      if (doc.exists) {
        return Regiao.fromMap(doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print('Erro ao obter região: $e');
    }
    return null;
  }

  Future<List<Regiao>> getAllRegioes() async {
    try {
      QuerySnapshot querySnapshot = await regionsCollection.get();
      List<Regiao> regioes = [];
      querySnapshot.docs.forEach((doc) {
        regioes.add(Regiao.fromMap(doc.data() as Map<String, dynamic>));
      });
      return regioes;
    } catch (e) {
      print('Erro ao obter todas as regiões: $e');
      return [];
    }
  }

  Future<void> updateRegion(Regiao regiao) async {
    try {
      await regionsCollection.doc(regiao.id).update(regiao.toMap());
      print('Região atualizada com sucesso.');
    } catch (e) {
      print('Erro ao atualizar região: $e');
    }
  }

  Future<void> deleteRegion(String id) async {
    try {
      await regionsCollection.doc(id).delete();
      print('Região excluída com sucesso.');
    } catch (e) {
      print('Erro ao excluir região: $e');
    }
  }
}
