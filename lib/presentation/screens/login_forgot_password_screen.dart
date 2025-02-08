import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  // Controlador para el campo de correo electrónico
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    // Limpiar el controlador cuando la pantalla se destruya
    _emailController.dispose();
    super.dispose();
  }

  void _sendRecoveryEmail() {
    final String email = _emailController.text;

    if (email.isNotEmpty) {
      // Lógica para enviar correo de recuperación
      print('Correo de recuperación enviado a: $email');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Se ha enviado un correo a $email')),
      );

      // Puedes redirigir al usuario de vuelta al inicio de sesión
      Navigator.pop(context);
    } else {
      // Mostrar mensaje de error si el campo está vacío
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, ingresa tu correo electrónico')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recuperar Contraseña')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Recuperar Contraseña',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Ingresa tu correo electrónico para enviarte un enlace de recuperación.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            SizedBox(height: 16.0),
            // Campo de texto para ingresar el correo
            CustomTextField(
              fieldKey: Key("email"),
              texto: 'Correo Electrónico',
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.0),
            // Botón para enviar el correo de recuperación
            CustomButton(
              texto: 'Enviar Enlace de Recuperación',
              onPressed: _sendRecoveryEmail,
            ),
            SizedBox(height: 16.0),
            // Enlace para regresar a la pantalla de inicio de sesión
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Volver al Inicio de Sesión',
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
