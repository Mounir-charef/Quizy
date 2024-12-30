import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter TP1 App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<String> _questions = [
    'Is Flutter a framework for web development?',
    'Does Flutter use Dart as its programming language?',
    'Can Flutter be used for cross-platform mobile development?'
  ];

  int _currentQuestionIndex = 0;
  int _score = 0;

  void _answerQuestion(bool isCorrect) {
    if (isCorrect) {
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
            child: Text(
              _questions[_currentQuestionIndex],
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

class ScoreScreen extends StatelessWidget {
  final int totalQuestions;
  final int score;

  const ScoreScreen({Key? key, required this.totalQuestions, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Score'),
      ),
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
                Navigator.pop(context);
              },
              child: const Text('Back to Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
