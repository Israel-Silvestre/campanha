import 'package:flutter/material.dart';

import 'Pages/LoginPage/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(), // Agora estamos direcionando para a LoginPage
    );
  }
}
