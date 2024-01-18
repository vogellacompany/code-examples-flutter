import 'dart:math';

import 'package:math_pdf_generator/model.dart';

class MathProvider {
  static Random random = Random();

  static List<Exercise> createPageData(int complexity, int pages) {
    List<Exercise> exercises = [];

    var numberOfExercises = 28 * pages;

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
    int baseValueX = 0;
    int baseValueY = 0;

    switch (complexity) {
      case 0:
        baseValueX = 10;
        baseValueY = 10;
        break;
      case 1:
        baseValueX = 10;
        baseValueY = 40;
        break;
      case 2:
        baseValueX = 10;
        baseValueY = 100;
        break;
      case 3:
        baseValueX = 30;
        baseValueY = 100;
        break;
      case 4:
        baseValueX = 100;
        baseValueY = 100;
        break;
    }

    int erster = random.nextInt(baseValueX);
    int zweiter = random.nextInt(baseValueY);

    // Avoid to easy values
    switch (complexity) {
      case 0:
        if (erster < 2) {
          erster += 2;
        }
        if (zweiter < 2) {
          zweiter += 2;
        }
        break;
      case 1:
        if (erster < 5) {
          erster += 6 - erster + random.nextInt(4);
        }
        if (zweiter < 10) {
          zweiter += 10;
        }
        break;
      case 2:
        if (erster < 5) {
          erster += 5;
        }
        if (zweiter < 50) {
          zweiter += 50;
        }
        if (zweiter % 10 == 0) {
          zweiter += random.nextInt(10);
        }
        break;
      default:
        if (erster < 30) {
          erster += 30;
        }
        if (zweiter < 50) {
          zweiter += 50;
        }
        if (zweiter % 10 == 0) {
          zweiter += random.nextInt(10);
        }
        break;
    }
    var exchange = random.nextInt(2);
    String aufgabe;
    if (exchange == 0) {
      aufgabe = '$erster x $zweiter';
    } else {
      aufgabe = '$zweiter x $erster';
    }

    String loesung = (erster * zweiter).toString();
    return Exercise(aufgabe, loesung);
  }
}
