import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Button Examples'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle ElevatedButton press
                  print('ElevatedButton pressed');
                },
                child: const Text('Elevated Button'),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  // Handle TextButton press
                  print('TextButton pressed');
                },
                child: const Text('Text Button'),
              ),
              const SizedBox(height: 16),
              IconButton(
                onPressed: () {
                  // Handle IconButton press
                  print('IconButton pressed');
                },
                icon: const Icon(Icons.star),
              ),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: () {
                  // Handle OutlinedButton press
                  print('OutlinedButton pressed');
                },
                child: const Text('Outlined Button'),
              ),
              const SizedBox(height: 16),
              FloatingActionButton(
                onPressed: () {
                  // Handle FloatingActionButton press
                  print('FloatingActionButton pressed');
                },
                child: const Icon(Icons.add),
              ),
              const SizedBox(height: 16),
              ToggleButtons(
                onPressed: (int index) {
                  // Handle ToggleButtons press
                  print('ToggleButtons pressed: $index');
                },
                isSelected: List<bool>.filled(3, false),
                children: const [
                  Icon(Icons.star),
                  Icon(Icons.favorite),
                  Icon(Icons.thumb_up),
                ],
              ),
              const SizedBox(height: 16),
              ButtonBar(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle ElevatedButton in ButtonBar press
                      print('ElevatedButton in ButtonBar pressed');
                    },
                    child: const Text('Button in Bar'),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      // Handle OutlinedButton in ButtonBar press
                      print('OutlinedButton in ButtonBar pressed');
                    },
                    child: const Text('Outlined in Bar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
