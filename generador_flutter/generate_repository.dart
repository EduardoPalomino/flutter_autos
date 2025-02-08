import 'dart:io';

void main(List<String> args) async {
  if (args.isEmpty) {
    print("Uso: dart generate_repository.dart <nombre_modelo>");
    return;
  }

  final String modelName = args[0];
  final String className = "${modelName[0].toUpperCase()}${modelName.substring(1)}";
  final String repoName = "${className}Repository";
  final String fileName = modelName.toLowerCase();

  final buffer = StringBuffer();

  buffer.writeln("import '../models/$fileName.dart';");
  buffer.writeln("import 'dart:convert';");
  buffer.writeln("import 'package:http/http.dart' as http;\n");

  buffer.writeln("class $repoName {");
  buffer.writeln("  final String _baseUrl = 'https://tu-api.com/${modelName}s';\n");

  buffer.writeln("  Future<List<$className>> get${className}s() async {");
  buffer.writeln("    final response = await http.get(Uri.parse(_baseUrl));");
  buffer.writeln("    if (response.statusCode == 200) {");
  buffer.writeln("      List<dynamic> data = json.decode(response.body);");
  buffer.writeln("      return data.map((json) => $className.fromJson(json)).toList();");
  buffer.writeln("    } else {");
  buffer.writeln("      throw Exception('Error al cargar ${modelName}s');");
  buffer.writeln("    }");
  buffer.writeln("  }\n");

  buffer.writeln("  Future<void> add$className(String nombre) async {");
  buffer.writeln("    final response = await http.post(");
  buffer.writeln("      Uri.parse(_baseUrl),");
  buffer.writeln("      body: json.encode({'nombre': nombre}),");
  buffer.writeln("      headers: {'Content-Type': 'application/json'},");
  buffer.writeln("    );");
  buffer.writeln("    if (response.statusCode != 201) {");
  buffer.writeln("      throw Exception('Error al agregar ${modelName}');");
  buffer.writeln("    }");
  buffer.writeln("  }\n");

  buffer.writeln("  Future<void> update$className(int id, String nombre) async {");
  buffer.writeln("    final response = await http.put(");
  buffer.writeln("      Uri.parse('\$_baseUrl/\$id'),");
  buffer.writeln("      body: json.encode({'nombre': nombre}),");
  buffer.writeln("      headers: {'Content-Type': 'application/json'},");
  buffer.writeln("    );");
  buffer.writeln("    if (response.statusCode != 200) {");
  buffer.writeln("      throw Exception('Error al actualizar ${modelName}');");
  buffer.writeln("    }");
  buffer.writeln("  }\n");

  buffer.writeln("  Future<void> delete$className(int id) async {");
  buffer.writeln("    final response = await http.delete(Uri.parse('\$_baseUrl/\$id'));");
  buffer.writeln("    if (response.statusCode != 204) {");
  buffer.writeln("      throw Exception('Error al eliminar ${modelName}');");
  buffer.writeln("    }");
  buffer.writeln("  }");
  buffer.writeln("}");

  // Crear archivo
  final file = File('../lib/data/repositories/$fileName\_repository.dart');

  try {
    await file.writeAsString(buffer.toString());
    print('Archivo ${fileName}_repository.dart generado exitosamente.');
  } catch (e) {
    print('Error al escribir en el archivo: \$e');
  }
}
