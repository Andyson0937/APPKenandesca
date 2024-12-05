import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://uasdapi.ia3x.com/api';

  Future<List<dynamic>> fetchNoticias() async {
    final url = Uri.parse('$baseUrl/noticias');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error al obtener noticias');
    }
  }

  Future<List<dynamic>> fetchHorarios() async {
  final url = Uri.parse('$baseUrl/horarios');
  final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error al obtener horarios');
    }
  }
  Future<void> enviarPreseleccion(Map<String, dynamic> datos) async {
  final url = Uri.parse('$baseUrl/preseleccion');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: json.encode(datos),
  );

  if (response.statusCode != 200) {
    throw Exception('Error al enviar preselección');
  }
  }
  Future<Map<String, dynamic>> fetchDeuda() async {
  final url = Uri.parse('$baseUrl/deuda');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Error al obtener la deuda');
  }
  }
Future<List<dynamic>> fetchSolicitudes() async {
  final url = Uri.parse('$baseUrl/solicitudes');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Error al obtener solicitudes');
  }
}

Future<void> crearSolicitud(Map<String, dynamic> datos) async {
  final url = Uri.parse('$baseUrl/solicitudes');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: json.encode(datos),
  );

  if (response.statusCode != 200) {
    throw Exception('Error al enviar la solicitud');
  }
}

Future<List<dynamic>> fetchTareas() async {
  final url = Uri.parse('$baseUrl/tareas');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Error al obtener tareas');
  }
}
Future<List<dynamic>> fetchEventos() async {
  final url = Uri.parse('$baseUrl/eventos');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Error al obtener eventos');
  }
}

Future<List<dynamic>> fetchVideos() async {
  final url = Uri.parse('$baseUrl/videos');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Error al obtener videos');
  }
}


}
