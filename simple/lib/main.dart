import 'package:flutter/material.dart';

void main() => runApp(const MyApp()); // <.>

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        // <.>
        appBar: AppBar(
          title: const Text("This is my title"),
        ),
        body: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.access_alarm),
              Icon(Icons.adb),
            ],
          ),
        ),
      ),
    );
  }
}
