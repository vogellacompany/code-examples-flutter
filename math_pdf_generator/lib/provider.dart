import 'dart:math';

import 'package:math_pdf_generator/model.dart';

class MathProvider {
  static List<Exercise> createPageData(int complexity) {
    List<Exercise> exercises = [];
    Random random = Random();

    var numberOfExercises = 48;
    int baseValueX = 5;
    int baseValueY = 10;

    switch (complexity) {
      case 1:
        baseValueX = 5;
        break;
      case 2:
        baseValueX = 8;
        baseValueY = 30;

      case 3:
        baseValueX = 8;
        baseValueY = 100;
      case 4:
        baseValueX = 100;
        baseValueY = 100;
    }

    // Wertberechnung
    for (int i = 0; i < numberOfExercises; i++) {
      int erster = random.nextInt(baseValueX) + 2;
      int zweiter = random.nextInt(baseValueY) + 2;

      if (complexity == 2 && erster < 5) {
        erster += 6 - erster + random.nextInt(4);
      }
      if (complexity == 2 && zweiter < 10) {
        zweiter += 10;
      }

      if (complexity == 3 && zweiter < 50) {
        zweiter += 50;
      }
      if (complexity == 4 && erster < 50) {
        zweiter += 50;
      }

      if (complexity == 4 && erster < 50) {
        zweiter += 50;
      }

      String aufgabe = '$erster x $zweiter';
      String loesung = (erster * zweiter).toString();
      exercises.add(Exercise(aufgabe, loesung));
    }
    return exercises;
  }

  static Exercise newExercise() {
    Random random = Random();

    int erster = random.nextInt(5) + 5;
    int zweiter = random.nextInt(30) + 11;

    String aufgabe = '$erster x $zweiter';
    String loesung = (erster * zweiter).toString();
    return Exercise(aufgabe, loesung);
  }
}
