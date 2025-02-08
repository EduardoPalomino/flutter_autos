import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_link.dart';
import 'login_forgot_password_screen.dart'; // Asegúrate de definir esta pantalla
import 'login_register_screen.dart';        // Importar la pantalla de registro

class LoginScreen extends StatefulWidget {
  final void Function(String usuario, String password) onLogin;

  LoginScreen({required this.onLogin});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controladores para los campos de texto
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // Liberar los controladores cuando se destruye la pantalla
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Iniciar Sesión')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              texto: 'Usuario',
              fieldKey: Key("usuario"),
              controller: _userController,
            ),
            SizedBox(height: 16.0),
            CustomTextField(
              texto: 'Contraseña',
              fieldKey: Key("password"),
              controller: _passwordController,
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            CustomButton(
              texto: 'Ingresar',
              onPressed: () {
                final String usuario = _userController.text;
                final String password = _passwordController.text;

                // Llama a la función de login pasada por el widget padre
                widget.onLogin(usuario, password);
              },
            ),
            SizedBox(height: 16.0),
            CustomLink(
              texto: 'Olvidé mi contraseña',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
                );
              },
            ),
            SizedBox(height: 8.0),
            CustomLink(
              texto: 'Registrarse',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
