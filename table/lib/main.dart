import 'package:flutter/material.dart';

/// Flutter code sample for [DataTable].

void main() => runApp(const DataTableExampleApp());

class DataTableExampleApp extends StatelessWidget {
  const DataTableExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('DataTable Sample')),
        body: DataTableExample(),
      ),
    );
  }
}

class DataTableExample extends StatelessWidget {
  DataTableExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: _createHeader(),
      rows: _createRows(),
    );
  }

  List<DataRow> _createRows() {
    return <DataRow>[
      DataRow(
        cells: <DataCell>[
          DataCell(Text('Jennifer')),
          DataCell(Text('48')),
          DataCell(Text('Arche Nova Spielerin')),
        ],
      ),
      DataRow(
        cells: <DataCell>[
          DataCell(Text('Lars')),
          DataCell(Text('50')),
          DataCell(Text('Flutter Developer')),
        ],
      ),
      DataRow(
        cells: <DataCell>[
          DataCell(Text('Kiran')),
          DataCell(
            TextFormField(initialValue: "15"),
          ),
          DataCell(Text('Motiviert')),
        ],
      ),
      DataRow(
        cells: <DataCell>[
          DataCell(Text('Liam')),
          DataCell(Text('12')),
          DataCell(Text('Lieb')),
        ],
      ),
    ];
  }

  List<DataColumn> _createHeader() {
    return ["Name", "Age", "Role"]
        .map(
          (e) => DataColumn(
            label: Expanded(
              child: Text(
                e,
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
        )
        .toList();
  }
}
