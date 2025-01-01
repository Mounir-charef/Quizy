abstract class QuizEvent {}

class AnswerQuestionEvent extends QuizEvent {
  final bool response;

  AnswerQuestionEvent(this.response);
}

class ResetQuizEvent extends QuizEvent {}
