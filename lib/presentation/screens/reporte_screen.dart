import 'package:flutter/material.dart';

class ReporteScreen extends StatelessWidget {
  final TextEditingController _reporteTituloController = TextEditingController();
  final TextEditingController _reporteDescripcionController = TextEditingController();

  // Sección de reporte de actividades
  final TextEditingController _actividadesController = TextEditingController();
  final TextEditingController _kilometrosController = TextEditingController();
  final TextEditingController _tiempoInvertidoController = TextEditingController();

  // Sección de reporte de combustible
  final TextEditingController _consumoCombustibleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reporte de Datos'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView( // Permite desplazarse si el contenido es largo
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Título del Reporte:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _reporteTituloController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Ingrese un título para el reporte',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Descripción:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _reporteDescripcionController,
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Escriba la descripción del reporte',
                ),
              ),
              const SizedBox(height: 16),

              // Reporte de Actividades
              const Text(
                'Reporte de Actividades:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _actividadesController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Ingrese un resumen de las actividades completadas',
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _kilometrosController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Kilómetros recorridos',
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _tiempoInvertidoController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Tiempo invertido (en horas)',
                ),
              ),
              const SizedBox(height: 16),

              // Reporte de Combustible
              const Text(
                'Reporte de Combustible:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _consumoCombustibleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Consumo de combustible (litros)',
                ),
              ),
              const SizedBox(height: 16),

              // Gráfico de Productividad
              const Text(
                'Gráficos de Productividad:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[200],
                ),
                child: const Center(
                  child: Text(
                    'Gráfico de Productividad (ej. Tareas completadas vs. Tareas pendientes)',
                    style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Botón de Enviar Reporte
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    final titulo = _reporteTituloController.text.trim();
                    final descripcion = _reporteDescripcionController.text.trim();
                    final actividades = _actividadesController.text.trim();
                    final kilometros = _kilometrosController.text.trim();
                    final tiempo = _tiempoInvertidoController.text.trim();
                    final combustible = _consumoCombustibleController.text.trim();

                    if (titulo.isEmpty || descripcion.isEmpty || actividades.isEmpty || kilometros.isEmpty || tiempo.isEmpty || combustible.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Por favor, complete todos los campos.'),
                        ),
                      );
                    } else {
                      // Simulación de envío del reporte
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Reporte enviado: $titulo'),
                        ),
                      );

                      // Limpiar campos
                      _reporteTituloController.clear();
                      _reporteDescripcionController.clear();
                      _actividadesController.clear();
                      _kilometrosController.clear();
                      _tiempoInvertidoController.clear();
                      _consumoCombustibleController.clear();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  ),
                  child: const Text('Enviar Reporte'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
