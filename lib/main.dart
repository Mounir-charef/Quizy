import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_page.dart';
import 'providers/quiz_provider.dart';
import 'models/question.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => QuizProvider(questions),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter TP2 App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

