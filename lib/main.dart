import 'package:flutter/material.dart';
import 'paginaUsuario.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste de API',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PaginaUsuario(), 
      debugShowCheckedModeBanner: false,
    );
  }
}
