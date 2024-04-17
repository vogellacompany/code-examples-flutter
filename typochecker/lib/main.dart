import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Typing Challenge',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TypingScreen(),
    );
  }
}

class TypingScreen extends StatefulWidget {
  const TypingScreen({super.key});

  @override
  TypingScreenState createState() => TypingScreenState();
}

class TypingScreenState extends State<TypingScreen> {
  final List<String> phrases = [
    'Schonend geht die Schonung umher',
    'Dart is a powerful language',
    'Coding is fun',
    'Mobile development with Flutter is amazing'
    // Add more phrases as needed
  ];

  String currentPhrase = '';
  String userInput = '';
  DateTime? startTime;
  DateTime? endTime;
  Random random = Random();

  @override
  void initState() {
    super.initState();
    generateRandomPhrase();
  }

  void generateRandomPhrase() {
    setState(() {
      currentPhrase = phrases[random.nextInt(phrases.length)];
      userInput = ''; // Clear previous user input
      startTime = DateTime.now(); // Capture start time
    });
  }

  void checkTyping() {
    endTime = DateTime.now(); // Capture end time

    if (userInput == currentPhrase) {
      // User typed correctly
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Congratulations!'),
          content: Text(
            'You typed the phrase correctly in ${calculateDuration()} seconds.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                generateRandomPhrase();
              },
              child: const Text('Next Phrase'),
            ),
          ],
        ),
      );
    } else {
      // User made a mistake
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Try Again'),
          content: const Text('You made a mistake. Try again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  String calculateDuration() {
    if (startTime != null && endTime != null) {
      Duration duration = endTime!.difference(startTime!);
      return duration.inSeconds.toString();
    }
    return 'N/A';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Typing Challenge'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LinearProgressIndicator(),
            const Text(
              'Type the following phrase:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              currentPhrase,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                setState(() {
                  userInput = value;
                });
              },
              onEditingComplete:
                  checkTyping, // Check typing when keyboard is closed
              decoration: const InputDecoration(
                labelText: 'Your Typing',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: checkTyping,
              child: const Text('Check Typing'),
            ),
          ],
        ),
      ),
    );
  }
}
