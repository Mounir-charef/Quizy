import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You scored ${quizProvider.score} out of ${quizProvider.totalQuestions}',
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

                // Reset the quiz
                quizProvider.resetQuiz();

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
