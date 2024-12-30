import 'package:flutter/material.dart';
import '../models/question.dart';
import 'score_page.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Question> _questions = [
    Question('Is Flutter a framework for web development?', false),
    Question('Does Flutter use Dart as its programming language?', true),
    Question('Can Flutter be used for cross-platform mobile development?', true),
  ];

  int _currentQuestionIndex = 0;
  int _score = 0;

  void _answerQuestion(bool userChoice) {
    if (_questions[_currentQuestionIndex].isCorrect == userChoice) {
      _score++;
    }

    setState(() {
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ScorePage(score: _score, total: _questions.length),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/quiz.png',
              height: 200,
            ),
            const SizedBox(height: 20),
            Text(
              'Question ${_currentQuestionIndex + 1} of ${_questions.length}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              currentQuestion.questionText,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _answerQuestion(true),
              child: const Text('True'),
            ),
            ElevatedButton(
              onPressed: () => _answerQuestion(false),
              child: const Text('False'),
            ),
          ],
        ),
      ),
    );
  }
}
