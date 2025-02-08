import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/actividad.dart';

class ActividadRepo {
  final String baseUrl = "http://localhost:3009/Actividads";

  Future<ActividadModel> getActividad(String nombre) async {
    final result = await http.get(Uri.parse(baseUrl));
    if (result.statusCode != 200) {
      throw Exception();
    }
    // Decodifica la respuesta como una lista de objetos, tipamos el response2 como un array con contenido dinamico
    final List<dynamic> response = json.decode(result.body);
    // Mapea la lista de JSON a objetos ActividadModel, osea convierte el contenido de la lista a objetos de tipo ActividadModel
    final List<ActividadModel> actividades = response
        .map((actividadJson) => ActividadModel.fromJson(actividadJson))
        .toList();
    // Busca la actividad con el nombre dado
    final actividadEncontrada = actividades.firstWhere(
          (actividad) => actividad.nombre.toLowerCase() == nombre.toLowerCase(),
      orElse: () => throw Exception("Actividad no encontrada"),
    );
    print('ActividadEncontrada: ${actividadEncontrada}');
    //return ActividadModel.fromJson(response);
    return actividadEncontrada;
  }

  /// Obtiene una lista de todas las actividades
  Future<List<ActividadModel>> getActividades() async {
    final result = await http.get(Uri.parse(baseUrl));
    if (result.statusCode != 200) {
      throw Exception("Error al obtener actividades");
    }

    final List<dynamic> response = json.decode(result.body);
    return response.map((json) => ActividadModel.fromJson(json)).toList();
  }

  /// Obtiene una actividad por su ID
  Future<ActividadModel> getActividadById(String id) async {
    final result = await http.get(Uri.parse("$baseUrl/$id"));
    if (result.statusCode != 200) {
      throw Exception("Actividad no encontrada");
    }

    return ActividadModel.fromJson(json.decode(result.body));
  }

  /// Crea una nueva actividad
  Future<ActividadModel> createActividad(ActividadModel actividad) async {
    final result = await http.post(
      Uri.parse("$baseUrl/create"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(actividad.toJson()),
    );

    if (result.statusCode != 201) {
      throw Exception("Error al crear actividad");
    }

    return ActividadModel.fromJson(json.decode(result.body));
  }

  /// Actualiza una actividad existente
  Future<ActividadModel> updateActividad(String id, ActividadModel actividad) async {
    final result = await http.put(
      Uri.parse("$baseUrl/update/$id"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(actividad.toJson()),
    );

    if (result.statusCode != 200) {
      throw Exception("Error al actualizar actividad");
    }

    return ActividadModel.fromJson(json.decode(result.body));
  }

  /// Elimina una actividad por ID
  Future<void> deleteActividad(String id) async {
    final result = await http.delete(Uri.parse("$baseUrl/delete/$id"));

    if (result.statusCode != 200) {
      throw Exception("Error al eliminar actividad");
    }
  }
}
