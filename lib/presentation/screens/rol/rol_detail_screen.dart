import 'package:flutter/material.dart';
import '../../../data/models/rol.dart';

class RolDetailScreen extends StatelessWidget {
  final Rol rol;

  RolDetailScreen({required this.rol});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detalle del Rol")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("id: ${rol.id}", style: TextStyle(fontSize: 16)),
Text("nombre: ${rol.nombre}", style: TextStyle(fontSize: 16)),
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
