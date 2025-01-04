import 'package:cloud_firestore/cloud_firestore.dart';

class Question {
  final String questionText;
  final bool isCorrect;

  Question({required this.questionText, required this.isCorrect});

  factory Question.fromFirestore(Map<String, dynamic> data) {
    return Question(
      questionText: data['questionText'] as String,
      isCorrect: data['isCorrect'] as bool,
    );
  }
}

Future<List<Question>> fetchQuestions() async {
  final querySnapshot = await FirebaseFirestore.instance.collection('questions').get();
  return querySnapshot.docs.map((doc) => Question.fromFirestore(doc.data())).toList();
}
