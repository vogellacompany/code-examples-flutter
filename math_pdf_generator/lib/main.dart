// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:math_pdf_generator/choose.dart';
import 'package:math_pdf_generator/home_page.dart';
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
      home: Scaffold(
        appBar: AppBar(
          title: Text('Matheaufgaben Generator'),
        ),
        body: ExerciseSelectionPage(),
      ),
    );
  }
}
