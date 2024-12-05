import 'package:flutter/material.dart';
import 'package:finalproyecto/services/api_service.dart';

class SolicitudesScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  SolicitudesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Solicitudes')),
      body: FutureBuilder<List<dynamic>>(
        future: apiService.fetchSolicitudes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final solicitudes = snapshot.data ?? [];
            return ListView.builder(
              itemCount: solicitudes.length,
              itemBuilder: (context, index) {
                final solicitud = solicitudes[index];
                return ListTile(
                  title: Text(solicitud['tipo']),
                  subtitle: Text('Estado: ${solicitud['estado']}'),
                  trailing: Icon(solicitud['estado'] == 'aprobada'
                      ? Icons.check_circle
                      : Icons.pending),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implementar lógica para crear una solicitud
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
