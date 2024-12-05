import 'package:flutter/material.dart';
import 'package:finalproyecto/services/api_service.dart';

class EventosScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  EventosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Eventos')),
      body: FutureBuilder<List<dynamic>>(
        future: apiService.fetchEventos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final eventos = snapshot.data ?? [];
            return ListView.builder(
              itemCount: eventos.length,
              itemBuilder: (context, index) {
                final evento = eventos[index];
                return ListTile(
                  title: Text(evento['titulo']),
                  subtitle: Text(evento['fecha']),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(evento['titulo']),
                          content: Text(evento['descripcion']),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cerrar'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
