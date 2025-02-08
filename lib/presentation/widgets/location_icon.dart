import 'package:flutter/material.dart';

class LocationIcon extends StatelessWidget {
  final VoidCallback onPressed;

  const LocationIcon({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.location_on),
      onPressed: onPressed,
    );
  }
}
