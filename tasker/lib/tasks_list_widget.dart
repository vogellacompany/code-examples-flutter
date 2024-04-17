import 'package:flutter/material.dart';
import 'package:tasker/model/task.dart';

class TasksListWidget extends StatelessWidget {
  final List<Task> tasks;
  final Function(Task, bool) toggleTaskCallback;

  const TasksListWidget(this.tasks, this.toggleTaskCallback, {super.key});

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
        toggleTaskCallback(task, value!);
      },
    );
  }
}
