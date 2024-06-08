import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Models/regiao.dart';

class RegiaoService {
  final CollectionReference _regioesCollection = FirebaseFirestore.instance.collection('Regiões');
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final ImagePicker _picker = ImagePicker();

  // Método para selecionar uma imagem do ImagePicker
  Future<File?> pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    return pickedFile != null ? File(pickedFile.path) : null;
  }

  // Método para fazer upload de uma imagem no Firebase Storage
  Future<String?> uploadImage(File imageFile, String imageName) async {
    try {
      Reference storageRef = _storage.ref().child('Regiões/$imageName');
      UploadTask uploadTask = storageRef.putFile(imageFile);
      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadURL = await taskSnapshot.ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
      print('Erro ao fazer upload da imagem: $e');
      return null;
    }
  }

  // Método para adicionar uma nova região
  Future<void> addRegiao(Regiao regiao, File imageFile) async {
    try {
      // Verifica se uma região com o mesmo nome já existe
      QuerySnapshot existingRegioes = await _regioesCollection.where('nome', isEqualTo: regiao.nome).get();

      if (existingRegioes.docs.isNotEmpty) {
        print('Erro: Região com o nome "${regiao.nome}" já existe.');
        return;
      }

      // Busca o maior ID existente e define o novo ID como o maior ID + 1
      QuerySnapshot allRegioes = await _regioesCollection.get();
      int newId = 1;
      if (allRegioes.docs.isNotEmpty) {
        List<int> ids = allRegioes.docs.map((doc) => int.parse(doc.id)).toList();
        newId = ids.reduce((value, element) => value > element ? value : element) + 1;
      }
      regiao.id = newId.toString();

      // Upload da imagem
      String? imageURL = await uploadImage(imageFile, regiao.nome);

      if (imageURL == null) {
        print('Erro: Não foi possível fazer upload da imagem.');
        return;
      }

      // Atualiza o atributo imageURL do objeto regiao
      regiao.imageURL = imageURL;

      // Adiciona a região com o novo ID
      await _regioesCollection.doc(regiao.id).set(regiao.toFirestore());
      print('Região adicionada com sucesso!');
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
