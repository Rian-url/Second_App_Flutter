import 'package:flutter/material.dart';
import 'paginaUsuario.dart'; // Ou qualquer arquivo que contenha a interface principal

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste de API',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: UsuariosPage(), // Chama a tela que usa fetchUsuarios()
    );
  }
}
