// Importing necessary Flutter material package for UI components
import 'package:flutter/material.dart';

// Importing a custom text style class for consistent styling
import 'package:quiz_app/style/text_style.dart';

// Creating a StatelessWidget to display the question summary
class QuestionSummary extends StatelessWidget {
  // Constructor accepting summary data (a list of maps)
  const QuestionSummary(this.summaryData, {super.key});

  // A list containing question details like index, question text, correct answer, and user answer
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500, // Setting a fixed height for the summary section
      child: SingleChildScrollView(
        // Enables scrolling if content exceeds height
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Aligns items to the top
                children: [
                  // Displays question index (1-based index)
                  TextStyleClass(
                    '${(data['index'] as int) + 1}.', // Extracts and increments the question index
                  ),
                  const SizedBox(
                      width:
                          10), // Adds spacing between index and question details

                  // Expanded ensures the question text and answers take up available space
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Aligns text to the left
                      children: [
                        // Displays the question text
                        TextStyleClass('Q. ${data['question']}'),
                        const SizedBox(
                            height: 10), // Spacing between question and answers

                        // Displays the correct answer
                        TextStyleClass('Correct Ans: ${data['correctAnswer']}'),

                        // Displays the user's selected answer
                        TextStyleClass('Your Ans: ${data['userAnswer']}'),

                        const SizedBox(
                            height: 20), // Adds spacing before the divider

                        // A horizontal line to separate each question block
                        const Divider(height: 10),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(), // Converts map results into a list of widgets
        ),
      ),
    );
  }
}
