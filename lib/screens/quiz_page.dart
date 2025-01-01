import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../quiz_bloc.dart';
import '../quiz_event.dart';
import '../quiz_state.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<QuizBloc, QuizState>(
          builder: (context, state) {
            if (state is QuizInProgressState) {
              return Text(
                'Question ${state.currentQuestionIndex + 1} of ${state.questions.length}',
              );
            }
            return const Text('Quiz');
          },
        ),
      ),
      body: BlocBuilder<QuizBloc, QuizState>(
        builder: (context, state) {
          if (state is QuizInProgressState) {
            final question = state.questions[state.currentQuestionIndex];
            return Column(
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
                    question.questionText,
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<QuizBloc>()
                        .add(AnswerQuestionEvent(true));
                  },
                  child: const Text('True'),
                ),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<QuizBloc>()
                        .add(AnswerQuestionEvent(false));
                  },
                  child: const Text('False'),
                ),
              ],
            );
          } else if (state is QuizFinishedState) {
            // Navigate to ScoreScreen when quiz finishes
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacementNamed(context, '/score');
            });
            return const SizedBox.shrink(); // Placeholder while navigating
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
