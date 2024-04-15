import 'package:flutter/material.dart';
import 'package:todo_list/task.dart';

class TaskListWidget extends StatelessWidget {
  final List<Task> tasks;
  TaskListWidget(this.tasks, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildTaskItem,
      itemCount: tasks.length,
    );
  }

  Widget _buildTaskItem(BuildContext context, int index) {
    final task = tasks[index];

    return CheckboxListTile(
      title: Text(task.title),
      value: task.isDone,
      onChanged: (value) {
        // _toggleTodo(task, value!);
      },
    );
  }
}
