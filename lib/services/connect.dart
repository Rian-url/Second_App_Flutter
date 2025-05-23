import 'package:http/http.dart' as http;
import 'dart:convert';

class Usuario {
  final int id;
  final String nome;

  Usuario({required this.id, required this.nome});

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['CD_USUARIO'], // ajuste ao nome do campo do SQL Server
      nome: json['NM_USUARIO'],
    );
  }
}

Future<List<Usuario>> fetchUsuarios() async {
  final response = await http.get(Uri.parse('http://localhost:3000/usuarios'));

  if (response.statusCode == 200) {
    List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((json) => Usuario.fromJson(json)).toList();
  } else {
    throw Exception('Erro ao carregar usuários');
  }
}