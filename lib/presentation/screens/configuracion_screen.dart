import 'package:flutter/material.dart';

class ConfigurationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Opciones de Usuario
          ListTile(
            leading: Icon(Icons.person, color: Colors.blue),
            title: const Text('Opciones de Usuario'),
            subtitle: const Text('Cambiar contraseña, nombre, foto'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserOptionsScreen()),
              );
            },
          ),
          const Divider(),

          // Notificaciones
          ListTile(
            leading: Icon(Icons.notifications, color: Colors.orange),
            title: const Text('Notificaciones'),
            subtitle: const Text('Configurar alertas de actividad, mantenimiento e incidentes'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationSettingsScreen()),
              );
            },
          ),
          const Divider(),

          // Ajustes de Ubicación
          ListTile(
            leading: Icon(Icons.location_on, color: Colors.green),
            title: const Text('Ajustes de Ubicación'),
            subtitle: const Text('Configurar preferencias del GPS y frecuencia de actualización'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LocationSettingsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Pantalla de Opciones de Usuario
class UserOptionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Opciones de Usuario'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: Icon(Icons.edit, color: Colors.blue),
            title: const Text('Cambiar Nombre'),
            onTap: () {
              // Implementa la acción aquí
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.lock, color: Colors.red),
            title: const Text('Cambiar Contraseña'),
            onTap: () {
              // Implementa la acción aquí
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.camera_alt, color: Colors.purple),
            title: const Text('Cambiar Foto'),
            onTap: () {
              // Implementa la acción aquí
            },
          ),
        ],
      ),
    );
  }
}

// Pantalla de Configuración de Notificaciones
class NotificationSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración de Notificaciones'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: Icon(Icons.notifications_active, color: Colors.orange),
            title: const Text('Alertas por Actividad'),
            trailing: Switch(
              value: true,
              onChanged: (value) {
                // Implementa la acción aquí
              },
            ),
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.build, color: Colors.teal),
            title: const Text('Alertas por Mantenimiento'),
            trailing: Switch(
              value: false,
              onChanged: (value) {
                // Implementa la acción aquí
              },
            ),
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.warning, color: Colors.red),
            title: const Text('Alertas por Incidente'),
            trailing: Switch(
              value: true,
              onChanged: (value) {
                // Implementa la acción aquí
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Pantalla de Configuración de Ubicación
class LocationSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajustes de Ubicación'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: Icon(Icons.update, color: Colors.green),
            title: const Text('Frecuencia de Actualización'),
            subtitle: const Text('Cada 10 minutos'),
            onTap: () {
              // Implementa la acción aquí
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.gps_fixed, color: Colors.blue),
            title: const Text('Modo de Ubicación'),
            subtitle: const Text('Alta precisión'),
            onTap: () {
              // Implementa la acción aquí
            },
          ),
        ],
      ),
    );
  }
}
