import '../models/rol.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RolRepository {
  final String _baseUrl = 'http://localhost:3009/Rols';

  Future<List<Rol>> getRols() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Rol.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar rols');
    }
  }

  Future<void> addRol(String nombre) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/create'),
      body: json.encode({'nombre': nombre}),
      headers: {'Content-Type': 'application/json'},
    );

    print('Response status: ${response.statusCode}'); // Agrega esto
    print('Response body: ${response.body}'); // Agrega esto

    if (response.statusCode != 201) {
      throw Exception('Error al agregar rol');
    }

  }

  Future<void> updateRol(String id, String nombre) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/update/$id'),
      body: json.encode({'nombre': nombre}),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode != 200) {
      throw Exception('Error al actualizar rol');
    }
  }

  Future<void> deleteRol(String id) async {
    final response = await http.delete(Uri.parse('$_baseUrl/delete/$id'));
    print('REPOSITORY');
    print('Response deleteRol: ${response.statusCode}');
    if (response.statusCode != 200) {
      throw Exception('Error al eliminar rol');
    }
  }






}
