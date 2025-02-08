import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;
  const CustomButton({super.key, required this.texto, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return ElevatedButton(
    style: style,
    onPressed: onPressed,
    child:  Text(texto),
    );
  }
}
