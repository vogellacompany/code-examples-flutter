import 'dart:io';
import 'dart:convert';

import 'package:path_provider/path_provider.dart';
import 'package:tasker/model/task.dart';

class DataService {
  Future<List<Task>> load() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      File file = File('${directory.path}/tasks.json');

      if (await file.exists()) {
        String jsonString = await file.readAsString();
        List<dynamic> jsonList = json.decode(jsonString);

        return jsonList.map((jsonTask) => Task.fromJson(jsonTask)).toList();
      }
    } catch (e) {
      // Something wrong with the file, lets restart
      return [];
    }
    return [];
  }

  Future<bool> save(List<Task> tasks) async {
    try {
      final directory = await getApplicationDocumentsDirectory();

      File file = File('${directory.path}/tasks.json');

      // Convert list to JSON
      List<Map<String, dynamic>> jsonList =
          tasks.map((task) => task.toJson()).toList();

      // Save JSON into the file (create or overwrite)
      await file.writeAsString(json.encode(jsonList), flush: true);

      return true; // Successfully saved
    } catch (e) {
      return false;
    }
  }
}
