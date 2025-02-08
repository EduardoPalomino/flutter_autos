import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/blocs/rol/rol_bloc.dart';
import '../../../data/models/rol.dart';
import '../../widgets/custom_text_field.dart';

class RoleEditScreen extends StatelessWidget {
  final Rol rol;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  RoleEditScreen({required this.rol}) {
    _nameController.text = rol.nombre;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Editar Rol")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                controller: _nameController,
                texto: "Nombre del Rol",
                validator: (value) {
                  if (value == null || value.isEmpty) { // Verifica si value es null o está vacío
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
                        context.read<RolBloc>().add(
                          UpdateRolEvent(
                            rol.id,
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