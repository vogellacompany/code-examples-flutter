import 'package:flutter/material.dart';

class ExerciseSelectionPage extends StatefulWidget {
  ExerciseSelectionPage({super.key});

  @override
  State<ExerciseSelectionPage> createState() => _ExerciseSelectionPageState();
}

class _ExerciseSelectionPageState extends State<ExerciseSelectionPage> {
  int complecity = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.blue,
            child: Row(
              children: [
                DropdownMenu(
                  initialSelection: 0,
                  width: 150,
                  label: Text("Scwierigkeit"),
                  enableFilter: true,
                  onSelected: (value) {
                    if (value != null) {
                      complecity = value;
                    }
                  },
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: 1, label: "Leicht"),
                    DropdownMenuEntry(value: 2, label: 'Mittel'),
                    DropdownMenuEntry(value: 3, label: 'Schwer'),
                    DropdownMenuEntry(value: 4, label: 'Sehr Schwer'),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(55),
                ),
                DropdownMenu(
                  initialSelection: 0,
                  width: 150,
                  label: Text("Seitenanzahl"),
                  enableFilter: true,
                  onSelected: (value) {
                    if (value != null) {
                      complecity = value;
                    }
                  },
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: 1, label: "1"),
                    DropdownMenuEntry(value: 2, label: '2'),
                    DropdownMenuEntry(value: 3, label: '3'),
                    DropdownMenuEntry(value: 4, label: '4'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
