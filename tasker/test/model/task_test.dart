import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tasker/model/task.dart';

void main() {
  test('Default for done is false', () {
    final task = Task(title: "Learn Flutter");
    expect(task.isDone, false);
  });

  test('Task can be changed', () {
    var changedText = "Finished learning Flutter";
    final task = Task(title: "Learn Flutter");
    task.isDone = true;
    expect(task.isDone, true);
    task.title = changedText;
    expect(task.title, changedText);
  });

  test('Save and restore task to and from  JSON', () {
    final task = Task(title: "Learn Flutter");
    var map = task.toJson();
    expect(map, isNotNull);
    var newTask = Task.fromJson(map);
    expect(newTask.title, equals(task.title));
    expect(newTask.isDone, equals(task.isDone));
  });
}
