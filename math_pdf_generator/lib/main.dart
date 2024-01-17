// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:math_pdf_generator/model.dart';
import 'package:math_pdf_generator/previewpage.dart';
import 'package:math_pdf_generator/provider.dart';

void main() {
  runApp(MyApp());
}

// https://blog.logrocket.com/how-create-pdfs-flutter/
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multiplier Exercise',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Exercise> data = MathProvider.createPageData(2);

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
                  subtitle: Text("Easy"),
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
                    )),
          );
        },
        child: Icon(Icons.picture_as_pdf_outlined),
      ),
    );
  }

  void _handleTap(int index) {
    // Replace the tapped element with a new value
    setState(
      () {
        data[index] = MathProvider.newExercise();
      },
    );
  }
}
