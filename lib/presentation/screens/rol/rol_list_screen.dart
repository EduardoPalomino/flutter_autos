import 'package:autos/presentation/screens/rol/rol_edit_screen.dart';
import 'package:autos/presentation/screens/rol/rol_nuevo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/blocs/rol/rol_bloc.dart';
import '../../widgets/item_lista.dart';
import 'confirmation_dialog.dart';

class RoleListScreen extends StatefulWidget { // 1. Convertir a StatefulWidget
  @override
  _RoleListScreenState createState() => _RoleListScreenState();
}

class _RoleListScreenState extends State<RoleListScreen> {
  @override
  void initState() {
    super.initState();
    // 2. Cargar roles solo al iniciar la pantalla
    context.read<RolBloc>().add(LoadRolEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listado de Roles"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RoleCreateScreen()),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<RolBloc, RolState>(
        builder: (context, state) {
          if (state is RolLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is RolSuccessState) {
            return ListView.builder(
              itemCount: state.roles.length,
              itemBuilder: (context, index) {
                final rol = state.roles[index];
                return ItemList(
                  title: rol.nombre,
                  onEdit: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RoleEditScreen(rol: rol),
                      ),
                    );
                  },
                  onDelete: () {
                    showDialog(
                      context: context,
                      builder: (context) => ConfirmationDialog(
                        onConfirm: () {
                          context.read<RolBloc>().add(DeleteRolEvent(rol.id));

                        },
                      ),
                    );
                  },
                );
              },
            );
          } else if (state is RolErrorState) {
            return Center(child: Text(state.message));
          }
          return Center(child: Text("Presiona 'Cargar' para ver los roles."));
        },
      ),
    );
  }
}

