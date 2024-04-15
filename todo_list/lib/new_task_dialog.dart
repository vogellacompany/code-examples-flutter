import 'package:flutter/material.dart';
import 'package:todo_list/task.dart';

class NewTaskDialog extends StatelessWidget {
  final controller = TextEditingController();

  NewTaskDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('New task'),
      content: TextField(
        controller: controller,
        autofocus: true,
      ),
      actions: [
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Add'),
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
