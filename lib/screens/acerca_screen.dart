import 'package:flutter/material.dart';

class AcercaScreen extends StatelessWidget {
  final List<Map<String, String>> desarrolladores = [
    {'nombre': 'Franchesca Alfonseca', 'matricula': '2022-0514'},
    {'nombre': 'Kendry Aristy', 'matricula': '2022-0090'},
    {'nombre': 'Andyson Vargas', 'matricula': '2022-0937'},
  ];

  AcercaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Acerca de')),
      body: ListView.builder(
        itemCount: desarrolladores.length,
        itemBuilder: (context, index) {
          final dev = desarrolladores[index];
          return ListTile(
            title: Text(dev['nombre'] ?? ''),
            subtitle: Text('Matrícula: ${dev['matricula']}'),
          );
        },
      ),
    );
  }
}
