import 'package:bloc/bloc.dart';
import 'quiz_event.dart';
import 'quiz_state.dart';
import '../models/question.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  final List<Question> _questions = questions;

  QuizBloc() : super(QuizInProgressState(0, 0, questions)) {
    // Handle AnswerQuestionEvent
    on<AnswerQuestionEvent>((event, emit) {
      if (_questions[_currentQuestionIndex].isCorrect == event.response) {
        _score++;
      }

      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
        emit(QuizInProgressState(_currentQuestionIndex, _score, _questions));
      } else {
        emit(QuizFinishedState(_score, _questions.length));
      }
    });

    // Handle ResetQuizEvent
    on<ResetQuizEvent>((event, emit) {
      _score = 0;
      _currentQuestionIndex = 0;
      emit(QuizInProgressState(_currentQuestionIndex, _score, _questions));
    });
  }
}
