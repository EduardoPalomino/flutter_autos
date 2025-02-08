import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  ConfirmationDialog({required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Confirmar"),
      content: Text("¿Estás seguro de eliminar este rol?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("No"),
        ),
        TextButton(
          onPressed: () {
            onConfirm();
            return Navigator.pop(context);
          },
          child: Text("Sí"),
        ),
      ],
    );
  }
}