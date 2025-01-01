import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../quiz_bloc.dart';
import '../quiz_state.dart';
import '../quiz_event.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        if (state is QuizFinishedState) {
          final score = state.score;
          final totalQuestions = state.totalQuestions;

          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You scored $score out of $totalQuestions',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context.read<QuizBloc>().add(ResetQuizEvent());
                      Navigator.pushReplacementNamed(context, '/');
                    },
                    child: const Text(
                      'Go back',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        // Handle unexpected states
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'An error occurred. Returning to home.',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                CircularProgressIndicator(),
              ],
            ),
          ),
        );
      },
    );
  }
}
