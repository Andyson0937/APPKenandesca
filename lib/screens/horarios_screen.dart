import 'package:flutter/material.dart';
import 'package:finalproyecto/services/api_service.dart';

class HorariosScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  HorariosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Horarios')),
      body: FutureBuilder<List<dynamic>>(
        future: apiService.fetchHorarios(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final horarios = snapshot.data ?? [];
            return ListView.builder(
              itemCount: horarios.length,
              itemBuilder: (context, index) {
                final horario = horarios[index];
                return ListTile(
                  title: Text(horario['materia']),
                  subtitle: Text('${horario['hora']} - Aula: ${horario['aula']}'),
                  onTap: () {
                    // Aquí abrirías un mapa
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
