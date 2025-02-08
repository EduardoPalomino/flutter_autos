import 'package:flutter/material.dart';

import '../widgets/custom_data_table.dart';

void main() => runApp(PantallaPrueba());

class PantallaPrueba extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: CustomDataTable(
                headers: ['Name', 'Age', 'Role'],
                data: [
                ['Sarah', '19', 'Student'],
                ['Janine', '43', 'Professor'],
                ['William', '27', 'Associate Professor'],
                ],
          ),
        ),
      ),
      ),
    );
  }
}
