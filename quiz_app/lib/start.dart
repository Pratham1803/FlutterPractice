import 'package:flutter/material.dart';
import 'package:quiz_app/style/text_style.dart';

class Start extends StatelessWidget {
  const Start(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz_logo.png',
            width: 300,
            color: const Color.fromARGB(151, 255, 255, 255),
          ),
          const SizedBox(height: 80),
          const TextStyleClass('Learn Flutter the fun Way!',
              textType: 'heading'),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            label: const TextStyleClass('Start Quiz'),
            icon: const Icon(
              Icons.arrow_right_alt,
            ),
          ),
        ],
      ),
    );
  }
}
