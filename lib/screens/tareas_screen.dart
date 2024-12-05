import 'package:flutter/material.dart';
import 'package:finalproyecto/services/api_service.dart';

class TareasScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  TareasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mis Tareas')),
      body: FutureBuilder<List<dynamic>>(
        future: apiService.fetchTareas(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final tareas = snapshot.data ?? [];
            return ListView.builder(
              itemCount: tareas.length,
              itemBuilder: (context, index) {
                final tarea = tareas[index];
                return ListTile(
                  title: Text(tarea['titulo']),
                  subtitle: Text('Vence: ${tarea['fecha_limite']}'),
                  onTap: () {
                    // Aquí rediriges al aula virtual
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
