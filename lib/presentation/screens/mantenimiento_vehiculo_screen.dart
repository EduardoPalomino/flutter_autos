import 'package:flutter/material.dart';

class MantenimientoVehiculoScreen extends StatelessWidget {
  // Simulación de una lista de mantenimientos
  final List<Map<String, String>> mantenimientos = [
    {
      "vehiculo": "Toyota Corolla",
      "servicio": "Cambio de aceite",
      "fecha": "10/01/2025",
      "estado": "Completado",
    },
    {
      "vehiculo": "Honda Civic",
      "servicio": "Revisión de frenos",
      "fecha": "15/01/2025",
      "estado": "Pendiente",
    },
    {
      "vehiculo": "Ford Ranger",
      "servicio": "Alineación y balanceo",
      "fecha": "20/01/2025",
      "estado": "Pendiente",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mantenimiento Vehículo'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          // Botón para agendar un nuevo mantenimiento
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Acción para agendar un nuevo servicio
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Agendar nuevo mantenimiento'),
                ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              ),
              child: const Text('Agendar Mantenimiento'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: mantenimientos.length,
              itemBuilder: (context, index) {
                final mantenimiento = mantenimientos[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(
                      'Vehículo: ${mantenimiento["vehiculo"]}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Servicio: ${mantenimiento["servicio"]}'),
                        Text('Fecha: ${mantenimiento["fecha"]}'),
                        Text('Estado: ${mantenimiento["estado"]}'),
                      ],
                    ),
                    trailing: mantenimiento["estado"] == "Pendiente"
                        ? ElevatedButton(
                      onPressed: () {
                        // Acción para marcar como completado
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Servicio completado para ${mantenimiento["vehiculo"]}'),
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                      child: const Text('Completar'),
                    )
                        : const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                    isThreeLine: true,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
