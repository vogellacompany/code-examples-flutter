import 'package:flutter/material.dart';
import 'package:tasker/model/task.dart';

class NewTaskDialog extends StatelessWidget {
  final controller = TextEditingController();

  NewTaskDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('New task'),
      content: TextField(
        controller: controller,
        autofocus: true,
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Add'),
          onPressed: () {
            final task = Task(title: controller.value.text);
            controller.clear();

            Navigator.of(context).pop(task);
          },
        ),
      ],
    );
  }
}
