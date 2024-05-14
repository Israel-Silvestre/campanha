import 'package:flutter/material.dart';

import '../HomePage/home_page.dart';

class LoginPage extends StatelessWidget {
  // Ajuste este valor conforme necessário para mover a logomarca para a direita
  static const double logoPaddingHorizontal = 50.0;

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
              // Botões de Cadastre-se e Efetuar Login
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Implemente a navegação para a tela de cadastro
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellowAccent, // Cor de fundo azul
                    ),
                    child: Text(
                      'Cadastre-se',
                      style: TextStyle(color: Colors.black), // Cor do texto branco
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellowAccent, // Cor de fundo amarelo
                    ),
                    child: Text(
                      'Efetuar Login',
                      style: TextStyle(color: Colors.black), // Cor do texto preto
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
