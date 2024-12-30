import 'package:flutter/material.dart';
import '../models/question.dart';

class QuizProvider with ChangeNotifier {
  int _currentQuestionIndex = 0;
  int _score = 0;
  final List<Question> _questions;


  int get currentQuestionIndex => _currentQuestionIndex;
  int get score => _score;
  int get totalQuestions => _questions.length;
  int get questionNumber => _currentQuestionIndex + 1;
  List<Question> get questions => _questions;

  void answerQuestion(bool response) {
    if (_questions[_currentQuestionIndex].isCorrect == response) {
      _score++;
    }
    if (_currentQuestionIndex < _questions.length - 1) {
      _currentQuestionIndex++;
    }
    notifyListeners();
  }

  void resetQuiz() {
    _score = 0;
    _currentQuestionIndex = 0;
    notifyListeners();  // Réinitialiser et notifier
  }

  QuizProvider(this._questions);
}
