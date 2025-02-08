import 'package:flutter/material.dart';

class CustomDataTable extends StatelessWidget {
  final List<String> headers;
  final List<List<String>> data;

  const CustomDataTable({
    super.key,
    required this.headers,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: headers.map((header) => DataColumn(
        label: Expanded(
          child: SelectableText(
            header,
            style: const TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
          ),
        ),
      )).toList(),
      rows: data.map((row) => DataRow(
        cells: row.map((cell) => DataCell(SelectableText(cell))).toList(),
      )).toList(),
    );
  }
}
