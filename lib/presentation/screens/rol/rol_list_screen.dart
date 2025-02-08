import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/blocs/rol/rol_bloc.dart';
import '../../widgets/item_lista.dart';
import 'confirmation_dialog.dart';
import 'rol_edit_screen.dart';
import 'rol_nuevo_screen.dart';

class RolListScreen extends StatefulWidget {
  @override
  _RolListScreenState createState() => _RolListScreenState();
}

class _RolListScreenState extends State<RolListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<RolBloc>().add(LoadRolEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listado de Rol"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RolCreateScreen()),
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
              itemCount: state.rols.length,
              itemBuilder: (context, index) {
                final item = state.rols[index];
                return ItemList(
                  title: item.nombre,
                  onEdit: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RolEditScreen(item: item),
                      ),
                    );
                  },
                  onDelete: () {
                    showDialog(
                      context: context,
                      builder: (context) => ConfirmationDialog(
                        onConfirm: () {
                          context.read<RolBloc>().add(DeleteRolEvent(item.id));
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
          return Center(child: Text("Presiona 'Cargar' para ver los rol."));
        },
      ),
    );
  }
}
