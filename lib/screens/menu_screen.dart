import 'package:finalproyecto/main.dart';
import 'package:finalproyecto/screens/acerca_screen.dart';
import 'package:finalproyecto/screens/deuda_screen.dart';
import 'package:finalproyecto/screens/eventos_screen.dart';
import 'package:finalproyecto/screens/horarios_screen.dart';
import 'package:finalproyecto/screens/noticias_screen.dart';
import 'package:finalproyecto/screens/preseleccion_screen.dart';
import 'package:finalproyecto/screens/solicitudes_screen.dart';
import 'package:finalproyecto/screens/tareas_screen.dart';
import 'package:finalproyecto/screens/videos_screen.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menú Principal')),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.newspaper),
            title: const Text('Noticias'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NoticiasScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.schedule),
            title: const Text('Horarios'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HorariosScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Preselección'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PreseleccionScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.payments),
            title: const Text('Deuda'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DeudaScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.request_page),
            title: const Text('Solicitudes'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SolicitudesScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.assignment),
            title: const Text('Mis Tareas'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TareasScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.event),
            title: const Text('Eventos'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EventosScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.video_library),
            title: const Text('Videos'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VideosScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Acerca de'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AcercaScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Salir'),
            onTap: () {
              logout(context);
            },
          ),
        ],
      ),
    );
  }
}
