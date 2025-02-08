import 'package:flutter/material.dart';

class ActividadesAsignadasScreen extends StatelessWidget {
  // Lista de actividades simulada
  final List<Map<String, String>> actividades = [
    {
      "cliente": "Cliente A",
      "direccion": "Av. Principal 123",
      "fecha": "15/01/2025",
      "hora": "10:00 AM",
      "estado": "Pendiente",
    },
    {
      "cliente": "Cliente B",
      "direccion": "Calle Secundaria 456",
      "fecha": "15/01/2025",
      "hora": "1:00 PM",
      "estado": "En progreso",
    },
    {
      "cliente": "Cliente C",
      "direccion": "Av. Industrial 789",
      "fecha": "15/01/2025",
      "hora": "4:00 PM",
      "estado": "Completada",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actividades Asignadas'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: actividades.length,
        itemBuilder: (context, index) {
          final actividad = actividades[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text('Cliente: ${actividad["cliente"]}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Dirección: ${actividad["direccion"]}'),
                  Text('Fecha: ${actividad["fecha"]}'),
                  Text('Hora: ${actividad["hora"]}'),
                  Text('Estado: ${actividad["estado"]}'),
                ],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (actividad["estado"] == "Pendiente")
                    ElevatedButton(
                      onPressed: () {
                        // Acción para iniciar actividad
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Actividad iniciada: ${actividad["cliente"]}'),
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: const Text('Iniciar'),
                    ),
                  if (actividad["estado"] == "En progreso")
                    ElevatedButton(
                      onPressed: () {
                        // Acción para finalizar actividad
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Actividad finalizada: ${actividad["cliente"]}'),
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                      child: const Text('Finalizar'),
                    ),
                ],
              ),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}
