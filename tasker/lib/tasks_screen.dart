import 'package:flutter/material.dart';
import 'package:tasker/task.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<StatefulWidget> createState() => TasksScreenState();
}

class TasksScreenState extends State<TasksScreen> {
  List<Task> tasks = [];
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task List'),
      ),
      body: ListView.builder(
        itemBuilder: _buildTaskItem,
        itemCount: tasks.length,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _addTask();
        },
      ),
    );
  }

  Widget _buildTaskItem(BuildContext context, int index) {
    final task = tasks[index];

    return CheckboxListTile(
      title: Text(task.title),
      value: task.isDone,
      onChanged: (value) {
        _toggleTodo(task, value!);
      },
    );
  }

  _addTask() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Create new task'),
          content: TextField(
            controller: controller,
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(
                  () {
                    final task = Task(title: controller.value.text);

                    tasks.add(task);
                    controller.clear();

                    Navigator.of(context).pop();
                  },
                );
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  _toggleTodo(Task task, bool isChecked) {
    setState(() {
      task.isDone = isChecked;
    });
  }
}
