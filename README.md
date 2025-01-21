# Flutter Quiz App

A simple Flutter application that presents a quiz to the user and displays the score at the end.
[![Watch the video](https://via.placeholder.com/800x450.png?text=Click+to+play)](https://github.com/Mounir-charef/Quizy/blob/master/Screen_recording_20250121_143114.webm)

## Features

- Displays a series of true/false questions.
- Tracks the user's score.
- Shows the final score on a separate screen.

## Screens

1. **Profile Card Page**: Displays a profile card with user information.
2. **Quiz Page**: Presents quiz questions and allows the user to answer.
3. **Score Page**: Displays the user's score after completing the quiz.

## Getting Started

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Dart SDK: Included with Flutter

### Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/your-username/flutter-quiz-app.git
    ```
2. Navigate to the project directory:
    ```sh
    cd flutter-quiz-app
    ```
3. Install dependencies:
    ```sh
    flutter pub get
    ```

### Running the App

1. Run the app on an emulator or connected device:
    ```sh
    flutter run
    ```

## Project Structure

- `lib/screens/profile_card.dart`: Contains the `ProfileCardPage` widget.
- `lib/screens/quiz_page.dart`: Contains the `QuizPage` widget and quiz logic.
- `lib/screens/score_page.dart`: Contains the `ScoreScreen` widget.
- `lib/models/question.dart`: Defines the `Question` model.

## Dependencies

- `flutter`: The Flutter framework.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
