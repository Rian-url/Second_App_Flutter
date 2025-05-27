import 'dart:convert';
import 'package:http/http.dart' as http;


class Usuario {
final int id;
final String nome; 

Usuario({required this.id, required this.nome});

factory Usuario.fromJson(Map<String, dynamic> json){
  return Usuario(
    id: json['CD_USUARIO'],
    nome: json['NM_USUARIO']
  );
}

}

Future<List<Usuario>> BuscaUsuarios() async{

final resposta = await http.get(Uri.parse('http://localhost:3000/usuarios'));

try{
  List<dynamic> listaJson = jsonDecode(resposta.body);
  return listaJson.map((json ) => Usuario.fromJson(json)).toList();
}catch(erro){
  throw Exception('Erro ao buscar usuários, erro: $erro');
}

}
