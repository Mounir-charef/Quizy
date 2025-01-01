import 'models/question.dart';

abstract class QuizState {}


class QuizInProgressState extends QuizState {
  final int currentQuestionIndex;
  final int score;
  final List<Question> questions;

  QuizInProgressState(this.currentQuestionIndex, this.score, this.questions);
}

class QuizFinishedState extends QuizState {
  final int score;
  final int totalQuestions;

  QuizFinishedState(this.score, this.totalQuestions);
}
