import 'dart:math';

import 'package:math_pdf_generator/model.dart';

class MathProvider {
  static Random random = Random();

  static List<Exercise> createPageData(int complexity) {
    List<Exercise> exercises = [];

    var numberOfExercises = 56;

    // Wertberechnung
    for (int i = 0; i < numberOfExercises; i++) {
      Exercise exercise = newExercise(complexity);
      int counter = 0;
      while (exercises.contains(exercise) && counter++ <= 5) {
        exercise = newExercise(complexity);
      }
      counter == 0;
      exercises.add(exercise);
    }
    return exercises;
  }

  static Exercise newExercise(int complexity) {
    int baseValueX = 10;
    int baseValueY = 10;

    switch (complexity) {
      case 1:
        baseValueX = 8;
        baseValueY = 30;

      case 2:
        baseValueX = 8;
        baseValueY = 100;
      case 3:
        baseValueX = 100;
        baseValueY = 100;
    }

    int erster = random.nextInt(baseValueX);
    int zweiter = random.nextInt(baseValueY);

    if (complexity == 0 && erster < 2) {
      erster += 2;
    }

    if (complexity == 0 && zweiter < 2) {
      zweiter += 2;
    }

    if (complexity == 1 && erster < 5) {
      erster += 6 - erster + random.nextInt(4);
    }
    if (complexity == 1 && zweiter < 10) {
      zweiter += 10;
    }
    if (complexity == 2 && erster < 10) {
      erster += 10;
    }
    if (complexity == 2 && zweiter < 50) {
      zweiter += 50;
    }
    if (complexity == 3 && erster < 50) {
      erster += 50;
    }

    if (complexity == 3 && zweiter < 50) {
      zweiter += 50;
    }

    String aufgabe = '$erster x $zweiter';
    String loesung = (erster * zweiter).toString();
    return Exercise(aufgabe, loesung);
  }
}
