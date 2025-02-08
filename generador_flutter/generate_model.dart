import 'dart:io';

void main(List<String> args) async {
  if (args.length < 2) {
    print("Uso: dart generate_model.dart <nombre_modelo> <campo1,campo2,campo3,...>");
    return;
  }

  final String modelName = args[0];
  final String className = "${modelName[0].toUpperCase()}${modelName.substring(1)}";
  final List<String> fields = args[1].split(',');

  final buffer = StringBuffer();

  // Generar la clase
  buffer.writeln('class $className {');

  // Declarar los campos
  for (var field in fields) {
    buffer.writeln('  final String $field;');
  }

  // Constructor
  buffer.writeln('  $className({');
  for (var field in fields) {
    buffer.writeln('    required this.$field,');
  }
  buffer.writeln('  });\n');

  // Método fromJson
  buffer.writeln('  factory $className.fromJson(Map<String, dynamic> json) {');
  buffer.writeln('    return $className(');
  for (var field in fields) {
    buffer.writeln('      $field: json["$field"],');
  }
  buffer.writeln('    );');
  buffer.writeln('  }\n');

  // Método toJson
  buffer.writeln('  Map<String, dynamic> toJson() {');
  buffer.writeln('    return {');
  for (var field in fields) {
    buffer.writeln('      "$field": $field,');
  }
  buffer.writeln('    };');
  buffer.writeln('  }\n');

  buffer.writeln('}');

  // Crear archivo
  final file = File('../lib/data/models/${modelName.toLowerCase()}.dart');

  try {
    await file.writeAsString(buffer.toString());
    print('Archivo ${modelName.toLowerCase()}.dart generado exitosamente.');
  } catch (e) {
    print('Error al escribir en el archivo: \$e');
  }
}
