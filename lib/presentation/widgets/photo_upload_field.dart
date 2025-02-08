import 'package:flutter/material.dart';
import 'dart:io';

class PhotoUploadField extends StatelessWidget {
  final VoidCallback onPhotoUpload;

  const PhotoUploadField({Key? key, required this.onPhotoUpload}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPhotoUpload,
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
