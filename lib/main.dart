import 'package:flutter/material.dart';
import 'package:finalproyecto/screens/landing_screen.dart';
import 'package:finalproyecto/screens/login_screen.dart';
import 'package:finalproyecto/screens/menu_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UASD App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingScreen(),
        '/login': (context) => const LoginScreen(),
        '/menu': (context) => const MenuScreen(),
        // Agrega las rutas adicionales según necesites
      },
    );
  }
}

void logout(BuildContext context) {
  // Aquí puedes limpiar cualquier dato de sesión almacenado
  Navigator.pushReplacementNamed(context, '/login');
}
