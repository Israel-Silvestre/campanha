import 'package:cloud_firestore/cloud_firestore.dart';
import '../Models/demanda.dart';

class DemandaService {
  final CollectionReference _demandasCollection = FirebaseFirestore.instance.collection('Demandas');

  Future<void> addDemanda(Demanda demanda) async {
    try {
      await _demandasCollection.doc(demanda.id).set(demanda.toFirestore());
    } catch (e) {
      print('Erro ao adicionar demanda: $e');
    }
  }

  Future<Demanda?> getDemandaById(String id) async {
    try {
      DocumentSnapshot doc = await _demandasCollection.doc(id).get();
      if (doc.exists) {
        return Demanda.fromFirestore(doc);
      }
    } catch (e) {
      print('Erro ao buscar demanda: $e');
    }
    return null;
  }

  Future<void> updateDemanda(Demanda demanda) async {
    try {
      await _demandasCollection.doc(demanda.id).update(demanda.toFirestore());
    } catch (e) {
      print('Erro ao atualizar demanda: $e');
    }
  }

  Future<void> deleteDemanda(String id) async {
    try {
      await _demandasCollection.doc(id).delete();
    } catch (e) {
      print('Erro ao deletar demanda: $e');
    }
  }

  Future<List<Demanda>> getAllDemandas() async {
    try {
      QuerySnapshot querySnapshot = await _demandasCollection.get();
      return querySnapshot.docs.map((doc) => Demanda.fromFirestore(doc)).toList();
    } catch (e) {
      print('Erro ao buscar todas as demandas: $e');
      return [];
    }
  }
}
