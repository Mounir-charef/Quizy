import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/home_page.dart';
import 'screens/quiz_page.dart';
import 'screens/score_page.dart';
import 'quiz_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => QuizBloc(),
      child: MaterialApp(
        title: 'Flutter TP2-2 App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/quiz': (context) => const QuizPage(),
          '/score': (context) => const ScoreScreen(),
        },
      ),
    );
  }
}
