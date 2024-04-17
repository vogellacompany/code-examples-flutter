import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String input;
  const DetailScreen(this.input, {super.key}); // <.>

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail screen'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(input),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, "This is the return value");
              },
              child: const Text('Go back!'),
            ),
          ],
        ),
      ),
    );
  }
}
