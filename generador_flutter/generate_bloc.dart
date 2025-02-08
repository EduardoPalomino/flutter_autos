import 'dart:io';

void main(List<String> args) async {
  if (args.isEmpty) {
    print("Uso: dart generate_bloc.dart <nombre_modelo>");
    return;
  }

  final String modelName = args[0];
  final String className = "${modelName[0].toUpperCase()}${modelName.substring(1)}";
  final String blocPath = '../lib/business_logic/blocs/$modelName';

  await Directory(blocPath).create(recursive: true);

  final Map<String, String> files = {
    "$blocPath/${modelName}_bloc.dart": "import 'dart:async';\n"
        "import 'package:flutter_bloc/flutter_bloc.dart';\n"
        "import 'package:equatable/equatable.dart';\n"
        "import '../../../data/models/$modelName.dart';\n"
        "import '../../../data/repositories/${modelName}_repository.dart';\n\n"
        "part '${modelName}_event.dart';\n"
        "part '${modelName}_state.dart';\n\n"
        "class ${className}Bloc extends Bloc<${className}Event, ${className}State> {\n"
        "  final ${className}Repository ${modelName}Repository;\n\n"
        "  ${className}Bloc(this.${modelName}Repository) : super(${className}InitialState());\n\n"
        "  @override\n"
        "  Stream<${className}State> mapEventToState(${className}Event event) async* {\n"
        "    if (event is Load${className}Event) {\n"
        "      yield ${className}LoadingState();\n"
        "      try {\n"
        "        final items = await ${modelName}Repository.get${className}s();\n"
        "        yield ${className}LoadedState(items);\n"
        "      } catch (e) {\n"
        "        yield ${className}ErrorState(e.toString());\n"
        "      }\n"
        "    } else if (event is Add${className}Event) {\n"
        "      try {\n"
        "        await ${modelName}Repository.add${className}(event.nombre);\n"
        "        yield* _reload${className}s();\n"
        "      } catch (e) {\n"
        "        yield ${className}ErrorState(e.toString());\n"
        "      }\n"
        "    } else if (event is Update${className}Event) {\n"
        "      try {\n"
        "        await ${modelName}Repository.update${className}(event.id, event.nombre);\n"
        "        yield* _reload${className}s();\n"
        "      } catch (e) {\n"
        "        yield ${className}ErrorState(e.toString());\n"
        "      }\n"
        "    } else if (event is Delete${className}Event) {\n"
        "      try {\n"
        "        await ${modelName}Repository.delete${className}(event.id);\n"
        "        yield* _reload${className}s();\n"
        "      } catch (e) {\n"
        "        yield ${className}ErrorState(e.toString());\n"
        "      }\n"
        "    }\n"
        "  }\n\n"
        "  Stream<${className}State> _reload${className}s() async* {\n"
        "    yield ${className}LoadingState();\n"
        "    try {\n"
        "      final items = await ${modelName}Repository.get${className}s();\n"
        "      yield ${className}LoadedState(items);\n"
        "    } catch (e) {\n"
        "      yield ${className}ErrorState(e.toString());\n"
        "    }\n"
        "  }\n"
        "}",

    "$blocPath/${modelName}_event.dart": "part of '${modelName}_bloc.dart';\n\n"
        "abstract class ${className}Event {}\n\n"
        "class Load${className}Event extends ${className}Event {}\n\n"
        "class Add${className}Event extends ${className}Event {\n"
        "  final String nombre;\n"
        "  Add${className}Event(this.nombre);\n"
        "}\n\n"
        "class Update${className}Event extends ${className}Event {\n"
        "  final int id;\n"
        "  final String nombre;\n"
        "  Update${className}Event(this.id, this.nombre);\n"
        "}\n\n"
        "class Delete${className}Event extends ${className}Event {\n"
        "  final int id;\n"
        "  Delete${className}Event(this.id);\n"
        "}",

    "$blocPath/${modelName}_state.dart": "part of '${modelName}_bloc.dart';\n\n"
        "abstract class ${className}State {}\n\n"
        "class ${className}InitialState extends ${className}State {}\n\n"
        "class ${className}LoadingState extends ${className}State {}\n\n"
        "class ${className}LoadedState extends ${className}State {\n"
        "  final List<${className}> items;\n"
        "  ${className}LoadedState(this.items);\n"
        "}\n\n"
        "class ${className}ErrorState extends ${className}State {\n"
        "  final String message;\n"
        "  ${className}ErrorState(this.message);\n"
        "}"
  };

  for (var entry in files.entries) {
    final file = File(entry.key);
    await file.writeAsString(entry.value);
    print('Archivo ${entry.key} generado exitosamente.');
  }
}
