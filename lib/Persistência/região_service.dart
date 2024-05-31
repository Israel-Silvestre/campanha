import 'package:cloud_firestore/cloud_firestore.dart';
import '../Models/regiao.dart';

class RegiaoService {
  final CollectionReference _regioesCollection = FirebaseFirestore.instance.collection('Regiões');

  // Método para adicionar uma nova região
  Future<void> addRegiao(Regiao regiao) async {
    try {
      // Obtém a referência para a coleção de regiões
      QuerySnapshot querySnapshot = await _regioesCollection.get();
      int nextId = querySnapshot.docs.length + 1; // Obtém o próximo ID

      // Adiciona a região com o ID calculado
      await _regioesCollection.doc(nextId.toString()).set(regiao.toFirestore());
    } catch (e) {
      print('Erro ao adicionar região: $e');
    }
  }


  // Método para atualizar uma região existente
  Future<void> updateRegiao(String docId, Regiao regiao) async {
    try {
      await _regioesCollection.doc(docId).update(regiao.toFirestore());
    } catch (e) {
      print('Erro ao atualizar região: $e');
    }
  }

  // Método para deletar uma região
  Future<void> deleteRegiao(String docId) async {
    try {
      await _regioesCollection.doc(docId).delete();
    } catch (e) {
      print('Erro ao deletar região: $e');
    }
  }

  // Método para obter uma região específica pelo ID do documento
  Future<Regiao?> getRegiaoById(String docId) async {
    try {
      DocumentSnapshot doc = await _regioesCollection.doc(docId).get();
      if (doc.exists) {
        return Regiao.fromFirestore(doc);
      }
    } catch (e) {
      print('Erro ao obter região: $e');
    }
    return null;
  }

  // Método para obter todas as regiões
  Future<List<Regiao>> getAllRegioes() async {
    try {
      QuerySnapshot? querySnapshot = await _regioesCollection.get();
      List<Regiao> regioes = [];
      querySnapshot.docs.forEach((doc) {
        try {
          regioes.add(Regiao.fromFirestore(doc));
        } catch (e) {
          print('Erro ao converter documento para Regiao: $e');
        }
      });
      return regioes;
        } catch (e) {
      print('Erro ao obter regiões: $e');
      return [];
    }
  }

  Future<String?> getRegiaoNameById(int regiaoId) async {
    try {
      DocumentSnapshot doc = await _regioesCollection.doc(regiaoId.toString()).get();
      if (doc.exists) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return data['nome'] as String?;
      } else {
        print('Região não encontrada para o ID: $regiaoId');
      }
    } catch (e) {
      print('Erro ao obter nome da região: $e');
    }
    return null;
  }

}
