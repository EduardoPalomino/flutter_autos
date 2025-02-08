import 'package:flutter/material.dart';

class ReporteIncidenciaScreen extends StatelessWidget {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reporte de Incidencias'),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Título de la Incidencia:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _tituloController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ingrese un título descriptivo',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Descripción de la Incidencia:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _descripcionController,
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Describa la incidencia con detalles...',
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  final titulo = _tituloController.text.trim();
                  final descripcion = _descripcionController.text.trim();

                  if (titulo.isEmpty || descripcion.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Por favor, complete todos los campos.'),
                      ),
                    );
                  } else {
                    // Lógica para enviar la incidencia (API, base de datos, etc.)
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Incidencia reportada: $titulo',
                        ),
                      ),
                    );

                    // Limpiar los campos
                    _tituloController.clear();
                    _descripcionController.clear();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: const Text('Reportar Incidencia'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
