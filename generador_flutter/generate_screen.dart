import 'dart:io';

void main(List<String> args) async {
  if (args.length < 1) {
    print("Uso: dart generate_screen.dart <nombre_modelo>");
    return;
  }

  final String modelName = args[0];
  final String className = "${modelName[0].toUpperCase()}${modelName.substring(1)}";
  final String fileName = modelName.toLowerCase();

  final List<String> fields = args[1].split(',');


  final dir = Directory('../lib/presentation/screens/$modelName');
  if (!dir.existsSync()) {
    dir.createSync(recursive: true);
  }

  // Generar confirmation_dialog.dart
  final confirmationDialogContent = """
import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const ConfirmationDialog({required this.onConfirm, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Confirmar"),
      content: Text("¿Estás seguro de eliminar este $modelName?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("No"),
        ),
        TextButton(
          onPressed: () {
            onConfirm();
            Navigator.pop(context);
          },
          child: Text("Sí"),
        ),
      ],
    );
  }
}
""";

  final confirmationDialogFile = File('${dir.path}/confirmation_dialog.dart');
  await confirmationDialogFile.writeAsString(confirmationDialogContent);

// Generar user_detail_screen.dart (el nombre del archivo es dinámico)
  final userDetailScreenContent = """
import 'package:flutter/material.dart';
import '../../../data/models/$fileName.dart';

class ${className}DetailScreen extends StatelessWidget {
  final $className $fileName;

  ${className}DetailScreen({required this.$fileName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detalle del $className")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ${fields.map((field) => "Text(\"$field: \${$fileName.$field}\", style: TextStyle(fontSize: 16)),").join("\n")}
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navegar a la pantalla de gestión de permisos (si aplica)
              },
              child: Text("Gestionar Permisos"),
            ),
          ],
        ),
      ),
    );
  }
}
""";

  final userDetailScreenFile = File('${dir.path}/${fileName}_detail_screen.dart');
  await userDetailScreenFile.writeAsString(userDetailScreenContent);

// Generar user_edit_screen.dart (el nombre del archivo es dinámico)
  final userEditScreenContent = """
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/blocs/$fileName/${fileName}_bloc.dart';
import '../../../data/models/$fileName.dart';
import '../../widgets/custom_text_field.dart';

class ${className}EditScreen extends StatelessWidget {
  final $className $fileName;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  ${className}EditScreen({required this.$fileName}) {
    _nameController.text = $fileName.nombre;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Editar $className")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                controller: _nameController,
                texto: "Nombre del $className",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Campo obligatorio";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        context.read<${className}Bloc>().add(
                          Update${className}Event(
                            ${fileName}.id,
                            _nameController.text,
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: Text("Actualizar"),
                  ),
                  SizedBox(width: 10),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Cancelar"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
""";

  final userEditScreenFile = File('${dir.path}/${fileName}_edit_screen.dart');
  await userEditScreenFile.writeAsString(userEditScreenContent);



  // Generar user_list_screen.dart (el nombre del archivo es dinámico)
  // Generar user_list_screen.dart o rol_list_screen.dart dinámicamente
  final listScreenContent = """
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/blocs/$modelName/${modelName}_bloc.dart';
import '../../widgets/item_lista.dart';
import 'confirmation_dialog.dart';
import '${modelName}_edit_screen.dart';
import '${modelName}_nuevo_screen.dart';

class ${className}ListScreen extends StatefulWidget {
  @override
  _${className}ListScreenState createState() => _${className}ListScreenState();
}

class _${className}ListScreenState extends State<${className}ListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<${className}Bloc>().add(Load${className}Event());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listado de $className"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ${className}CreateScreen()),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<${className}Bloc, ${className}State>(
        builder: (context, state) {
          if (state is ${className}LoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ${className}SuccessState) {
            return ListView.builder(
              itemCount: state.${modelName}s.length,
              itemBuilder: (context, index) {
                final item = state.${modelName}s[index];
                return ItemList(
                  title: item.${fields[1]},
                  onEdit: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ${className}EditScreen(item: item),
                      ),
                    );
                  },
                  onDelete: () {
                    showDialog(
                      context: context,
                      builder: (context) => ConfirmationDialog(
                        onConfirm: () {
                          context.read<${className}Bloc>().add(Delete${className}Event(item.${fields[0]}));
                        },
                      ),
                    );
                  },
                );
              },
            );
          } else if (state is ${className}ErrorState) {
            return Center(child: Text(state.message));
          }
          return Center(child: Text("Presiona 'Cargar' para ver los $modelName."));
        },
      ),
    );
  }
}
""";

  // Guardar el archivo
  final listScreenFile = File('${dir.path}/${fileName}_list_screen.dart');
  await listScreenFile.writeAsString(listScreenContent);



  // Generar el contenido del archivo
  final newScreenContent = """
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/blocs/$modelName/${modelName}_bloc.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/custom_button.dart';

class ${className}CreateScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _${fields[1]}Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crear Nuevo $className"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                controller: _${fields[1]}Controller,
                texto: "Nombre del $className",  // Cambia "label" por "texto"
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Campo obligatorio";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              BlocConsumer<${className}Bloc, ${className}State>(
                listener: (context, state) {
                  if (state is ${className}SuccessState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("$className creado con éxito")),
                    );
                    Navigator.pop(context);
                  } else if (state is ${className}ErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is ${className}LoadingState) {
                    return CircularProgressIndicator();
                  }
                  return CustomButton(
                    texto: "Guardar",
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        context.read<${className}Bloc>().add(
                          Add${className}Event(_${fields[1]}Controller.text),
                        );
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
""";

  // Guardar el archivo
  final newScreenFile = File('${dir.path}/${fileName}_nuevo_screen.dart');
  await newScreenFile.writeAsString(newScreenContent);


  print('Archivos generados exitosamente en ${dir.path}.');
}
