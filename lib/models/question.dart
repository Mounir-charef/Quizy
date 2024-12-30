class Question {
  final String questionText;
  final bool isCorrect;

  Question(this.questionText, this.isCorrect);
}

final List<Question> questions = [
  Question('Flutter is an open-source UI software development kit created by Google.', true),
  Question('The first version of Flutter was known as Sky.', true),
  Question('Dart is a statically-typed programming language.', true),
  Question('Does flutter use native widgets?', false),
  Question('Flutter was first released in May 2017.', true),
  Question('The stable version of Flutter was released in December 2018.', true),
];

