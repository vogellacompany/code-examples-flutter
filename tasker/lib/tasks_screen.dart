import 'package:flutter/material.dart';
import 'package:tasker/data_service.dart'; // <.>
import 'package:tasker/new_task_dialog.dart';
import 'package:tasker/model/task.dart';
import 'package:tasker/tasks_list_widget.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  TasksScreenState createState() => TasksScreenState();
}

class TasksScreenState extends State<TasksScreen> {
  List<Task> tasks = [];
  DataService dataService = DataService(); // <.>

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task List'),
      ),
      body: TasksListWidget(
          tasks, (task, isChecked) => _toggleTodo(task, isChecked)),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _addTodo();
        },
      ),
    );
  }

  @override // <.>
  void initState() {
    // Load data
    _loadData(); // <.>
    super.initState();
  }

  // <.>
  Future<void> _loadData() async {
    List<Task> newTask = await dataService.load();
    setState(() {
      tasks = newTask;
    });
  }

  _addTodo() async {
    final task = await showDialog<Task>(
      context: context,
      builder: (BuildContext context) {
        return NewTaskDialog();
      },
    );
    if (task != null) {
      setState(
        () {
          tasks.add(task);
        },
      );
      dataService.save(tasks); // <.>
    }
  }

  _toggleTodo(Task task, bool isChecked) {
    setState(() {
      task.isDone = isChecked;
    });
    dataService.save(tasks); // <.>
  }
}
