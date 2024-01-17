import 'package:flutter/material.dart';
import 'package:math_pdf_generator/model.dart';
import 'package:math_pdf_generator/pdfcreator.dart';
import 'package:printing/printing.dart';

class PdfPreviewPage extends StatelessWidget {
  final List<Exercise> exercises;
  PdfPreviewPage({Key? key, required this.exercises}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Preview'),
      ),
      body: PdfPreview(
        build: (context) => makePdf(exercises),
      ),
    );
  }
}
