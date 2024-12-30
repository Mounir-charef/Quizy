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
    Question('Flutter is an open-source UI software development kit created by Google.', true),
    Question('The first version of Flutter was known as Sky.', true),
    Question('Dart is a statically-typed programming language.', true),
    Question('Does flutter use native widgets?', false),
    Question('Flutter was first released in May 2017.', true),
    Question('The stable version of Flutter was released in December 2018.', true),

  ];

  int _currentQuestionIndex = 0;
  int _score = 0;

  void _answerQuestion(bool response) {
    if (_questions[_currentQuestionIndex].isCorrect == response) {
      _score++;
    }
    setState(() {
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        // Navigate to a score screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ScoreScreen(
              totalQuestions: _questions.length,
              score: _score,
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Question ${_currentQuestionIndex + 1} of ${_questions.length}'),
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
              _questions[_currentQuestionIndex].questionText,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
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
    );
  }
}