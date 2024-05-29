import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../HomePage/home_page.dart';
import 'Controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  // Ajuste este valor conforme necessário para mover a logomarca para a direita
  static const double logoPaddingHorizontal = 50.0;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService _authService = AuthService(); // Instância do AuthService

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Definindo o fundo azul
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 60.0), // Adicione um espaço inicial
              // Logomarca centralizada
              Padding(
                padding: EdgeInsets.symmetric(horizontal: logoPaddingHorizontal),
                child: Image.asset(
                  'assets/logo.png', // Substitua 'assets/logo.png' pelo caminho da sua logomarca
                  width: MediaQuery.of(context).size.width * 0.6, // Ajuste o tamanho da logomarca conforme necessário
                  height: MediaQuery.of(context).size.width * 0.6, // Ajuste o tamanho da logomarca conforme necessário
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 20.0), // Adicione um espaço entre a logomarca e o campo de login
              // Campo de login
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Login',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(Icons.person, color: Colors.blue), // Ícone do usuário
                ),
              ),
              SizedBox(height: 10.0), // Espaçamento entre os campos
              // Campo de senha
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Senha',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(Icons.lock, color: Colors.blue), // Ícone de cadeado
                ),
              ),
              SizedBox(height: 20.0), // Espaçamento entre os campos e os botões
              // Botão de Efetuar Login preenchendo horizontalmente
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    // Chame o método de login
                    User? user = await _authService.signInWithEmailAndPassword(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                    );
                    if (user != null) {
                      // Se o login for bem-sucedido, navegue para a HomePage
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    } else {
                      // Se o login falhar, exiba uma mensagem de erro
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Erro de Login'),
                          content: Text('Usuário ou senha incorretos.'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellowAccent, // Cor de fundo amarelo
                  ),
                  child: Text(
                    'Efetuar Login',
                    style: TextStyle(color: Colors.black), // Cor do texto preto
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
