import 'package:flutter/material.dart';

class ScoreScreen extends StatelessWidget {
  final int totalQuestions;
  final int score;

  const ScoreScreen({super.key, required this.totalQuestions, required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You scored $score out of $totalQuestions',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the home page
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/', (Route<dynamic> route) => false,  // Remove all previous routes
                );

              },
              child: const Text(
                'Go back',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
