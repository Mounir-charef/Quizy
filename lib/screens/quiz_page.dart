import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'score_page.dart';
import '../providers/quiz_provider.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(
      builder: (context, quizProvider, child) {
        final currentQuestionIndex = quizProvider.currentQuestionIndex;
        final questions = quizProvider.questions;

        return Scaffold(
          appBar: AppBar(
            title: Text('Question ${currentQuestionIndex + 1} of ${questions.length}'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('assets/quiz.png', height: 200),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  questions[currentQuestionIndex].questionText,
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  quizProvider.answerQuestion(true);
                  if (quizProvider.currentQuestionIndex == questions.length - 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScoreScreen(),
                      ),
                    );
                  }
                },
                child: const Text('True'),
              ),
              ElevatedButton(
                onPressed: () {
                  quizProvider.answerQuestion(false);
                  if (quizProvider.currentQuestionIndex == questions.length - 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScoreScreen(),
                      ),
                    );
                  }
                },
                child: const Text('False'),
              ),
            ],
          ),
        );
      },
    );
  }
}
