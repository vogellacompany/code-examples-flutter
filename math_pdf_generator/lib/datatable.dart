import 'package:flutter/material.dart';
import 'package:math_pdf_generator/model.dart';
import 'package:math_pdf_generator/previewpage.dart';
import 'package:math_pdf_generator/provider.dart';

class DataTablePreview extends StatefulWidget {
  final int complexity;
  final int pages;
  const DataTablePreview(
      {super.key, required this.complexity, required this.pages});

  @override
  State<DataTablePreview> createState() => _DataTablePreviewState();
}

class _DataTablePreviewState extends State<DataTablePreview> {
  late List<Exercise> data;
  @override
  void initState() {
    super.initState();
    data = MathProvider.createPageData(widget.complexity, widget.pages);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preview'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Schwierigkeit: ${getStringForComplexity(widget.complexity)}\n",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            Text(
              "Drücke den Button, um das PDF zu generieren",
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
            Center(
              child: DataTable(
                columns: const [
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Aufgabe',
                        softWrap: true,
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                  DataColumn(
                    numeric: true,
                    label: Expanded(
                      child: Text(
                        'Lösung',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Neuer Wert',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                ],
                rows: [
                  for (var entry in data.asMap().entries)
                    DataRow(
                      cells: [
                        DataCell(
                          Text(entry.value.question),
                        ),
                        DataCell(
                          Text(entry.value.answer),
                        ),
                        DataCell(
                          Center(
                            child: Icon(Icons.calculate),
                          ),
                          onTap: () {
                            onLastCellSelected(entry.key);
                          },
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PdfPreviewPage(
                exercises: data,
                complexity: widget.complexity,
              ),
            ),
          );
        },
        child: Icon(Icons.picture_as_pdf_outlined),
      ),
    );
  }

  void onLastCellSelected(int key) {
    setState(() {
      data[key] = MathProvider.newExercise(widget.complexity);
    });
  }

  String getStringForComplexity(int complexity) {
    switch (complexity) {
      case 0:
        return "Leicht";
      case 1:
        return "Mittel";
      case 2:
        return "Hart";
      case 3:
        return "Superheld";
    }

    return '';
  }
}
