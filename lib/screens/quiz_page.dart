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


        bool handelAnswer(bool response) {
          quizProvider.answerQuestion(response);
          if (quizProvider.isFinished) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ScoreScreen(),
              ),
            );
          }
          return true;
        }

        return Scaffold(
          appBar: AppBar(
            title: Text('Question ${quizProvider.questionNumber} of ${quizProvider.totalQuestions}'),
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
                  quizProvider.questions[quizProvider.currentQuestionIndex].questionText,
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  handelAnswer(true);
                },
                child: const Text('True'),
              ),
              ElevatedButton(
                onPressed: () {
                  handelAnswer(false);
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
