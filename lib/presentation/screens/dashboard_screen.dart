import 'package:flutter/material.dart';
import 'reporte_incidencia_screen.dart';
import 'tarea_completada_screen.dart';
import 'actividad_asignada_screen.dart';
import 'gps_screen.dart';
import 'mantenimiento_vehiculo_screen.dart';
import 'reporte_screen.dart';
import 'configuracion_screen.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('Dashboard'),
              onTap: () {
                // Lógica para abrir la pantalla del Dashboard
              },
            ),
            ListTile(
              leading: Icon(Icons.task),
              title: Text('Actividades Asignadas'),
              onTap: () {
                // Lógica para abrir la pantalla de actividades asignadas
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ActividadesAsignadasScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Actividades Completadas'),
              onTap: () {
                // Lógica para abrir la pantalla de actividades completadas
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TareaCompletadaScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('GPS'),
              onTap: () {
                // Lógica para abrir la pantalla de GPS
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GpsScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.car_repair),
              title: Text('Mantenimiento de Vehículo'),
              onTap: () {
                // Lógica para abrir la pantalla de mantenimiento de vehículos
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MantenimientoVehiculoScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.report_problem),
              title: Text('Reporte de Incidencias'),
              onTap: () {
                // Lógica para abrir la pantalla de reporte de incidencias
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReporteIncidenciaScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.bar_chart),
              title: Text('Reporte General'),
              onTap: () {
                // Lógica para abrir la pantalla de reportes generales
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReporteScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configuración'),
              onTap: () {
                // Lógica para abrir la pantalla de configuraciones
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ConfigurationScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Tareas Asignadas',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Aquí debes usar la longitud de tu lista de tareas
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text('Tarea ${index + 1}'),
                      subtitle: Text('Estado: Pendiente'),
                      trailing: Icon(Icons.more_vert),
                      onTap: () {
                        // Lógica para ver más detalles de la tarea
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.add),
                  label: Text('Nueva Tarea'),
                  onPressed: () {
                    // Lógica para añadir nueva tarea
                  },
                ),
                ElevatedButton.icon(
                  icon: Icon(Icons.location_on),
                  label: Text('GPS'),
                  onPressed: () {
                    // Lógica para abrir la vista de GPS
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton.icon(
              icon: Icon(Icons.report),
              label: Text('Reportar Incidente'),
              onPressed: () {
                // Lógica para abrir la vista de reportar incidente
              },
            ),
          ],
        ),
      ),
    );
  }
}
