import 'package:flutter/material.dart';

class MenuIcon extends StatelessWidget {
  final VoidCallback onPressed;

  const MenuIcon({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.menu),
      onPressed: onPressed,
    );
  }
}
