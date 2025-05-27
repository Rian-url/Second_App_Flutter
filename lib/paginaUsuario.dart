import 'package:flutter/material.dart';
import 'Usuario.dart'; 

class PaginaUsuario extends StatelessWidget {
  const PaginaUsuario({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Usuários')),

      body: FutureBuilder<List<Usuario>>(

        future: BuscaUsuarios(),
        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());

          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));

          } else {

            final usuarios = snapshot.data!;
            return ListView.builder(
              itemCount: usuarios.length,

              itemBuilder: (context, index) {
                  final u = usuarios[index];

                return ListTile(
                  title: Text('Nome: ${u.nome}'),
                  subtitle: Text('Código: ${u.id}'),
                );
              }, 
            );
          }
        },
      ),
    );
  }
}

