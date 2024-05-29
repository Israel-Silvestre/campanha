import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Método para fazer login com email e senha
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (error) {
      print('Erro ao fazer login: $error');
      return null;
    }
  }

  // Método para registrar um novo usuário com email e senha
  Future<User?> registerWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (error) {
      print('Erro ao registrar usuário: $error');
      return null;
    }
  }

  // Método para fazer logout
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (error) {
      print('Erro ao fazer logout: $error');
    }
  }
}
