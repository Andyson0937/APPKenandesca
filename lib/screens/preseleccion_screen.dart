import 'package:flutter/material.dart';
import 'package:finalproyecto/services/api_service.dart';

class PreseleccionScreen extends StatefulWidget {
  const PreseleccionScreen({Key? key}) : super(key: key);

  @override
  _PreseleccionScreenState createState() => _PreseleccionScreenState();
}

class _PreseleccionScreenState extends State<PreseleccionScreen> {
  final ApiService apiService = ApiService();
  final List<String> materiasSeleccionadas = [];

  void enviarSeleccion() async {
    try {
      await apiService.enviarPreseleccion({'materias': materiasSeleccionadas});
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preselección enviada con éxito')),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error al enviar preselección')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Preselección')),
      body: Column(
        children: [
          // Aquí agregarías un widget para elegir materias
          ElevatedButton(
            onPressed: enviarSeleccion,
            child: const Text('Confirmar Preselección'),
          ),
        ],
      ),
    );
  }
}
