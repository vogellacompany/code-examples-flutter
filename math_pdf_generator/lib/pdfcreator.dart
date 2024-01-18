import 'dart:typed_data';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_pdf_generator/model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

Future<Uint8List> makePdf(List<Exercise> exercises, int complexity) async {
  final pdf = Document();

  const int chunkSize = 28;

  for (int i = 0; i < exercises.length; i += chunkSize) {
    List<Exercise> chunk = exercises.sublist(i, i + chunkSize);
    createPdfPage(pdf, chunk, complexity);
  }
  return pdf.save();
}

void createPdfPage(pw.Document pdf, List<Exercise> aufgaben, int complexity) {
  pdf.addPage(
    pw.Page(
      margin: EdgeInsets.all(20.0),
      build: (pw.Context context) {
        return Column(
          children: [
            Container(
              height: 10,
            ),
            createHeader(complexity),
            Container(height: 10),
            Divider(
              height: 1,
              borderStyle: BorderStyle.dashed,
            ),
            Container(
              height: 10,
            ),
            Table(
              border: TableBorder.all(color: PdfColors.black),
              children: [
                // The remaining rows contain each item from the invoice, and uses the
                // map operator (the ...) to include these items in the list
                ...aufgaben.map(
                  // Each new line item for the invoice should be rendered on a new TableRow
                  (e) {
                    return TableRow(
                      children: [
                        // We can use an Expanded widget, and use the flex parameter to specify
                        // how wide this particular widget should be. With a flex parameter of
                        // 2, the description widget will be 66% of the available width.
                        Expanded(
                          child: Padding(
                            child: Text(
                              "    ${e.question}",
                              textAlign: TextAlign.left,
                            ),
                            padding: EdgeInsets.all(5),
                          ),
                          flex: 2,
                        ),

                        Expanded(
                          child: Text("         "),
                          flex: 9,
                        ),
                        // Again, with a flex parameter of 1, the cost widget will be 33% of the
                        // available width.
                        Expanded(
                          child: Padding(
                            child: Text(
                              e.answer,
                              textAlign: TextAlign.center,
                            ),
                            padding: EdgeInsets.all(5),
                          ),
                          flex: 1,
                        )
                      ],
                    );
                  },
                ),
                // After the itemized breakdown of costs, show the tax amount for this invoice
                // In this case, it's just 10% of the invoice amount
              ],
            ),
            Container(
              height: 20,
            ),
            Divider(
              height: 1,
              borderStyle: BorderStyle.dashed,
            ),
            Container(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Dauer:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  "                                                     Fehler:   ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: PdfColors.black,
                      width: 2.0,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: PdfColors.black,
                      width: 2.0,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: PdfColors.black,
                      width: 2.0,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: PdfColors.black,
                      width: 2.0,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: PdfColors.black,
                      width: 2.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    ),
  );
}

pw.Row createHeader(int complexity) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        "Datum:",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      ),
      Expanded(
        child: SizedBox(
          width: 0,
        ),
      ),
      Container(
        child: Text(
          "Schwierigkeit: ${getStringForComplexity(complexity)}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
      ),
    ],
  );
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
