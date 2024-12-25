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
                    ((data['index'] as int) + 1).toString(),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        TextStyleClass(data['question'] as String),
                        TextStyleClass(data['correctAnswer'] as String),
                        TextStyleClass(data['userAnswer'] as String),
                        const SizedBox(
                          height: 20,
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
