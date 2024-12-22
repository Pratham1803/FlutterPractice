import 'package:flutter/material.dart';
import 'package:quiz_app/style/text_style.dart';

class AnswerButton extends StatelessWidget {
  final String answer;

  const AnswerButton(this.answer, this.onTap, {super.key});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          backgroundColor: const Color.fromARGB(255, 33, 1, 95),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: TextStyleClass(answer),
      ),
    );
  }
}
