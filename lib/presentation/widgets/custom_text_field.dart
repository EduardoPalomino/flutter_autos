import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String texto;  // Cambia "texto" por "label"
  final Key? fieldKey;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final TextStyle? textStyle;
  final String? Function(String?)? validator; // Agrega el parámetro validator

  const CustomTextField({
    super.key,
    required this.texto,  // Cambia "texto" por "label"
    this.fieldKey,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textStyle,
    this.validator, // Incluye el parámetro en el constructor
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        key: fieldKey,
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: textStyle,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: texto,  // Cambia "texto" por "label"
        ),
        validator: validator, // Asigna el validador
      ),
    );
  }
}