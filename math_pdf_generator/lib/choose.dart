import 'package:flutter/material.dart';
import 'package:math_pdf_generator/home_page.dart';

class ExerciseSelectionPage extends StatefulWidget {
  ExerciseSelectionPage({super.key});

  @override
  State<ExerciseSelectionPage> createState() => _ExerciseSelectionPageState();
}

class _ExerciseSelectionPageState extends State<ExerciseSelectionPage> {
  int level = 0;
  int pages = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/ic_launcher.png'),
            Container(
              padding: const EdgeInsets.all(40),
              child: Text(
                "Das ist eine App um Matheaufgaben zu erstellen und zu drucken. Nach dem Drucken falte das Blatt so, dass Du die Lösungen nicht siehst.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(
              height: 30,
            ),
            DropdownMenu(
              width: 250,
              label: Text('Level'),
              helperText: 'Selektiere den Schwierigkeitsgrad',
              leadingIcon: Icon(Icons.bar_chart_outlined),
              initialSelection: 0,
              dropdownMenuEntries: <DropdownMenuEntry<int>>[
                DropdownMenuEntry(value: 0, label: 'Einfach'),
                DropdownMenuEntry(value: 1, label: 'Mittel'),
                DropdownMenuEntry(value: 2, label: 'Hart'),
                DropdownMenuEntry(value: 3, label: 'Richtig Hard'),
                DropdownMenuEntry(value: 4, label: 'Superheld'),
              ],
              onSelected: (value) {
                setState(() {});
                level = value!;
              },
            ),
            //Padding(padding: EdgeInsets.all(12)),
            SizedBox(
              height: 30,
            ),
            DropdownMenu(
              width: 250,
              label: Text('Anzahl Seiten'),
              helperText: 'Selektiere die Anzahl der Druckseiten',
              leadingIcon: Icon(Icons.assignment_add),
              initialSelection: 1,
              dropdownMenuEntries: <DropdownMenuEntry<int>>[
                DropdownMenuEntry(value: 1, label: '1'),
                DropdownMenuEntry(value: 2, label: '2'),
                DropdownMenuEntry(value: 3, label: '3'),
                DropdownMenuEntry(value: 4, label: '4'),
              ],
              onSelected: (value) {
                setState(() {});
                pages = value!;
              },
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(
                      complexity: level,
                      pages: pages,
                    ),
                  ),
                );
              },
              child: Text("Schau Dir den Preview an"),
            ),
            // IconButton(onPressed: () {}, icon: Icon(Icons.gamepad_outlined)),
          ],
        ),
      ),
    );
  }
}
