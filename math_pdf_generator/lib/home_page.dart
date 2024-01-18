// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:math_pdf_generator/model.dart';
import 'package:math_pdf_generator/previewpage.dart';
import 'package:math_pdf_generator/provider.dart';

class MyHomePage extends StatefulWidget {
  final int complexity;
  final int pages;
  const MyHomePage({super.key, required this.complexity, required this.pages});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        title: Text('Aufgaben'),
      ),
      body: ListView(
        children: [
          for (var entry in data.asMap().entries)
            Column(
              children: [
                ListTile(
                  title: Text(
                    entry.value.question,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(_complexityLevel(widget.complexity)),
                  trailing: Text(
                    entry.value.answer,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () => _handleTap(entry.key),
                ),
                Divider(
                  height: 1, // Adjust the height of the divider as needed
                  color: Colors.grey, // You can change the color of the divider
                ),
              ],
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PdfPreviewPage(
                      exercises: data,
                      complexity: widget.complexity,
                    )),
          );
        },
        child: Icon(Icons.picture_as_pdf_outlined),
      ),
    );
  }

  String _complexityLevel(int) {
    switch (widget.complexity) {
      case 0:
        return 'Einfach';
      case 1:
        return 'Mittel';
      case 2:
        return 'Hart';
      case 3:
        return 'Superheld';
    }
    return '';
  }

  void _handleTap(int index) {
    // Replace the tapped element with a new value
    setState(
      () {
        data[index] = MathProvider.newExercise(widget.complexity);
      },
    );
  }
}
