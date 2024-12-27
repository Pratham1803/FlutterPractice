import 'package:flutter/material.dart';
import 'package:quiz_app/style/text_style.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                children: [
                  TextStyleClass(
                    '${(data['index'] as int) + 1}.',
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        TextStyleClass('Q. ${data['question']}'),
                        const SizedBox(height: 10),
                        TextStyleClass(
                            'Correct Ans: ${data['correctAnswer']}'),
                        TextStyleClass(
                            'Your Ans: ${data['userAnswer']}'),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(
                          height: 10,
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
