import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    createPdf();
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }

  Future<void> createPdf() async {
    Directory? directory = await getExternalStorageDirectory();
    String path = directory!.path;

    // Create a new PDF document.
    final PdfDocument document = PdfDocument();
// Add a PDF page and draw text.
    document.pages.add().graphics.drawString(
        'Hello World!', PdfStandardFont(PdfFontFamily.helvetica, 12),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(0, 0, 150, 20));

//Create the empty file.
    File file = File('$path/${'sample.pdf'}');
    //Write the PDF data retrieved from the SfPdfViewer.
    await file.writeAsBytes(await document.save(), flush: true);

    print(path);

    Share.shareXFiles([XFile(path)], text: 'Great picture');

    document.dispose();
  }
}
