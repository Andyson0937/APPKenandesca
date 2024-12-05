import 'package:flutter/material.dart';
import 'package:finalproyecto/services/api_service.dart';

class NoticiasScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  NoticiasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Noticias')),
      body: FutureBuilder<List<dynamic>>(
        future: apiService.fetchNoticias(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final noticias = snapshot.data ?? [];
            return ListView.builder(
              itemCount: noticias.length,
              itemBuilder: (context, index) {
                final noticia = noticias[index];
                return ListTile(
                  title: Text(noticia['titulo'] ?? 'Sin título'),
                  subtitle: Text(noticia['descripcion'] ?? 'Sin descripción'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
