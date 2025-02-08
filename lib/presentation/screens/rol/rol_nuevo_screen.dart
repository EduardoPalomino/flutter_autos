import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/blocs/rol/rol_bloc.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/custom_button.dart';

class RoleCreateScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crear Nuevo Rol"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                controller: _nombreController,
                texto: "Nombre del Rol",  // Cambia "label" por "texto"
                validator: (value) {
                  if (value == null || value.isEmpty) { // Verifica si value es null o está vacío
                    return "Campo obligatorio";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              BlocConsumer<RolBloc, RolState>(
                listener: (context, state) {
                  if (state is RolSuccessState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Rol creado con éxito")),
                    );
                    Navigator.pop(context);
                  } else if (state is RolErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is RolLoadingState) {
                    return CircularProgressIndicator();
                  }
                  return CustomButton(
                    texto: "Guardar",
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        context.read<RolBloc>().add(
                          AddRolEvent(_nombreController.text),
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