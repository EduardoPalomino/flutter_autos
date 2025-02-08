import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Controladores para los campos de texto
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // Limpiar controladores cuando se destruye la pantalla
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _register() {
    // Lógica para registrar al usuario
    final String username = _usernameController.text;
    final String email = _emailController.text;
    final String password = _passwordController.text;

    // Aquí puedes añadir la lógica de registro, como enviar los datos a un servidor
    print('Registro completado con los siguientes datos:');
    print('Username: $username');
    print('Email: $email');
    print('Password: $password');

    // Puedes realizar alguna acción después del registro, como navegar a otra pantalla
    // Navigator.pushReplacement(...);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registrarse')),
      body: Padding(
        padding: EdgeInsets.all(16.0),  // Añadimos un padding alrededor de todo el contenido
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Crea tu cuenta', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black)),
              SizedBox(height: 16),
              CustomTextField(
                texto: 'Nombre de Usuario',
                fieldKey: Key("username"),
                controller: _usernameController,  // Asignamos el controlador
              ),
              SizedBox(height: 16),
              CustomTextField(
                texto: 'Correo Electrónico',
                fieldKey: Key("email"),
                controller: _emailController,  // Asignamos el controlador
                keyboardType: TextInputType.emailAddress,  // Tipo de teclado para correo
              ),
              SizedBox(height: 16),
              CustomTextField(
                texto: 'Contraseña',
                fieldKey: Key("password"),
                controller: _passwordController,  // Asignamos el controlador
                obscureText: true,  // Campo oculto
              ),
              SizedBox(height: 16),
              CustomButton(
                texto: 'Registrarse',
                onPressed: _register,  // Llamamos a la función de registro
              ),
            ],
          ),
        ),
      ),
    );
  }
}
