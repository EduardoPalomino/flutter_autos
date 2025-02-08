import 'package:flutter/material.dart';

final buttonStyle = ElevatedButton.styleFrom(
  fixedSize: const Size(double.infinity, 45),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ),
);

final textFormBorder = OutlineInputBorder(
  borderSide: const BorderSide(width: 1),
  borderRadius: BorderRadius.circular(15),
);
