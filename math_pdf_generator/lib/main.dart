// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:math_pdf_generator/choose.dart';

void main() {
  runApp(MyApp());
}

// https://blog.logrocket.com/how-create-pdfs-flutter/
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Multiplier Exercise',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Matheaufgaben Generator'),
          backgroundColor: Color.fromARGB(255, 11, 9, 80),
        ),
        // body: MyHomePage(),
        body: ExerciseSelectionPage(),
      ),
    );
  }
}
