import 'dart:typed_data';

import 'package:math_pdf_generator/model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

Future<Uint8List> makePdf(List<Exercise> exercises) async {
  final pdf = Document();

  const int chunkSize = 24;

  for (int i = 0; i < exercises.length; i += chunkSize) {
    List<Exercise> chunk = exercises.sublist(i, i + chunkSize);
    createPdfPage(pdf, chunk);
  }
  return pdf.save();
}

void createPdfPage(pw.Document pdf, List<Exercise> aufgaben) {
  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Name:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 350,
                  child: Column(
                    children: [
                      Text("Startzeit:"),
                      Text("Endzeit:"),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
                Column(
                  children: [
                    Text("Tag:"),
                    Text("Dauer:"),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ],
            ),
            Container(height: 10),
            Divider(
              height: 1,
              borderStyle: BorderStyle.dashed,
            ),
            Container(height: 50),
            Table(
              border: TableBorder.all(color: PdfColors.black),
              children: [
                // The first row just contains a phrase 'INVOICE FOR PAYMENT'
                TableRow(
                  children: [
                    Padding(
                      child: Text(
                        'Start Time',
                        textAlign: TextAlign.center,
                      ),
                      padding: EdgeInsets.all(4),
                    ),
                  ],
                ),
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
                          flex: 7,
                        ),
                        // Again, with a flex parameter of 1, the cost widget will be 33% of the
                        // available width.
                        Expanded(
                          child: Padding(
                            child: Text(
                              e.answer,
                              textAlign: TextAlign.right,
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
          ],
        );
      },
    ),
  );
}
