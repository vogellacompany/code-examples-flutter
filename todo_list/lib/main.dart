import 'package:flutter/material.dart';
import 'package:todo_list/task.dart';
import 'package:todo_list/task_list_widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<Task> tasks = [];
    tasks.add(Task(title: "Nackenübungen"));
    tasks.add(
      Task(title: "Ask on BGA if how to find the best gamers in a game"),
    );
    return MaterialApp(
      title: 'Tasks',
      home: Scaffold(
        body: TaskListWidget(tasks),
      ),
    );
  }
}
