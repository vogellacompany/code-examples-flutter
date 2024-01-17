import 'package:flutter/material.dart';
import 'package:math_pdf_generator/home_page.dart';

class ExerciseSelectionPage extends StatefulWidget {
  ExerciseSelectionPage({super.key});

  @override
  State<ExerciseSelectionPage> createState() => _ExerciseSelectionPageState();
}

class _ExerciseSelectionPageState extends State<ExerciseSelectionPage> {
  int level = 0;
  int pages = 0;

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
                "Das ist eine App um Matheaufgaben zu erstellen und zu drucken",
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
              helperText: 'Select your difficulty level',
              leadingIcon: Icon(Icons.add_chart),
              initialSelection: 0,
              dropdownMenuEntries: <DropdownMenuEntry<int>>[
                DropdownMenuEntry(value: 0, label: 'easy'),
                DropdownMenuEntry(value: 1, label: 'medium'),
                DropdownMenuEntry(value: 2, label: 'hard'),
                DropdownMenuEntry(value: 3, label: 'superhero'),
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
              label: Text('Nr. Pages'),
              helperText: 'Select the number of pages',
              leadingIcon: Icon(Icons.assignment_add),
              initialSelection: 0,
              dropdownMenuEntries: <DropdownMenuEntry<int>>[
                DropdownMenuEntry(value: 0, label: '1'),
                DropdownMenuEntry(value: 1, label: '2'),
                DropdownMenuEntry(value: 2, label: '3'),
                DropdownMenuEntry(value: 3, label: '4'),
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
                    builder: (context) => MyHomePage(complexity: level),
                  ),
                );
              },
              child: Text("Look at the preview"),
            ),
            // IconButton(onPressed: () {}, icon: Icon(Icons.gamepad_outlined)),
          ],
        ),
      ),
    );
  }
}
