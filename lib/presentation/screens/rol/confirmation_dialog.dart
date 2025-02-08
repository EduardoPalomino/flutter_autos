import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const ConfirmationDialog({required this.onConfirm, Key? key}) : super(key: key);

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
            Navigator.pop(context);
          },
          child: Text("Sí"),
        ),
      ],
    );
  }
}
