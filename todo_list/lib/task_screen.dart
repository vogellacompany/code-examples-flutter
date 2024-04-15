import 'package:flutter/material.dart';
import 'package:todo_list/new_task_dialog.dart';
import 'package:todo_list/task.dart';
import 'package:todo_list/task_list_widget.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  TaskListState createState() => TaskListState();
}

class TaskListState extends State<TaskList> {
  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: TaskListWidget(tasks),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _addTodo();
        },
      ),
    );
  }

  _addTodo() async {
    final task = await showDialog<Task>(
      context: context,
      builder: (BuildContext context) {
        return NewTaskDialog();
      },
    );
    if (task != null) {
      setState(() {
        tasks.add(task);
      });
    }
  }

  _toggleTodo(Task task, bool isChecked) {
    setState(() {
      task.isDone = isChecked;
    });
  }
}
