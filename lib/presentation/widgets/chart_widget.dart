import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.blue[100],
      child: Center(
        child: Text('Chart Placeholder'),
      ),
    );
  }
}
