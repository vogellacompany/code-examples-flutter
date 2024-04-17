import 'package:tasker/model/repeat.dart';

class Task {
  String title;
  bool isDone;
  Repeat repeat;
  DateTime dateTime = DateTime.now();

  Task({required this.title, this.isDone = false, this.repeat = Repeat.never});

  // Convert Task instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isDone': isDone,
    };
  }

  // Create Task instance from JSON
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'],
      isDone: json['isDone'] ??
          false, // Default to false if 'isDone' is not present
    );
  }
}
