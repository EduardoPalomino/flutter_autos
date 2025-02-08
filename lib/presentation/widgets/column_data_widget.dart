import 'package:flutter/material.dart';

class ColumnDataWidget extends StatelessWidget {
  final String? title;
  final String? imageFile;
  final String? data;
  const ColumnDataWidget({Key? key, this.title, this.imageFile, this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 45,
          width: 45,
          child: Image.asset(imageFile!),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          data!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
