import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/demanda.dart';

class DemandaService {
  final CollectionReference demandsCollection = FirebaseFirestore.instance.collection('demands');

  // Método para adicionar uma demanda ao banco de dados
  Future<void> addDemand(Demanda demanda) async {
    try {
      await demandsCollection.doc(demanda.id).set(demanda.toMap());
      print('Demanda adicionada com sucesso.');
    } catch (e) {
      print('Erro ao adicionar demanda: $e');
    }
  }

  // Método para obter uma demanda do banco de dados pelo ID
  Future<Demanda?> getDemand(String id) async {
    try {
      DocumentSnapshot doc = await demandsCollection.doc(id).get();
      if (doc.exists) {
        return Demanda.fromMap(doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print('Erro ao obter demanda: $e');
    }
    return null;
  }

  // Método para buscar todas as demandas do banco de dados
  Future<List<Demanda>> getAllDemandas() async {
    try {
      QuerySnapshot querySnapshot = await demandsCollection.get();
      List<Demanda> demandas = querySnapshot.docs.map((doc) => Demanda.fromMap(doc.data() as Map<String, dynamic>)).toList();
      return demandas;
    } catch (e) {
      print('Erro ao buscar demandas: $e');
      return []; // Retorna uma lista vazia em caso de erro
    }
  }

  // Método para atualizar uma demanda no banco de dados
  Future<void> updateDemand(Demanda demanda) async {
    try {
      await demandsCollection.doc(demanda.id).update(demanda.toMap());
      print('Demanda atualizada com sucesso.');
    } catch (e) {
      print('Erro ao atualizar demanda: $e');
    }
  }

  // Método para excluir uma demanda do banco de dados
  Future<void> deleteDemand(String id) async {
    try {
      await demandsCollection.doc(id).delete();
      print('Demanda excluída com sucesso.');
    } catch (e) {
      print('Erro ao excluir demanda: $e');
    }
  }
}
