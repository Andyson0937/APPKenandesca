import 'package:flutter/material.dart';
import 'package:finalproyecto/services/api_service.dart';

class DeudaScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  DeudaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Estado de Deuda')),
      body: FutureBuilder<Map<String, dynamic>>(
        future: apiService.fetchDeuda(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final deuda = snapshot.data ?? {};
            return Column(
              children: [
                ListTile(
                  title: const Text('Monto Adeudado'),
                  subtitle: Text('${deuda['monto']} RD\$'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Redirige al enlace de pago
                    final url = deuda['link_pago'];
                    if (url != null) {
                      // Abre el enlace en un navegador
                    }
                  },
                  child: const Text('Pagar'),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
