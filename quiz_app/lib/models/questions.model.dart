/*
  QuestionModel:
  A model class representing a quiz question.

  Features:
  - Stores a question and a list of possible answers.
  - Provides a method to shuffle the answer options.

  Parameters:
  - question: The text of the question.
  - answers: A list of possible answers (first one is typically correct).

  Methods:
  - getShuffledAnswers(): Returns a shuffled version of the answers list.
*/

class QuestionModel {
  /*
    Constructor:
    - Takes a question string and a list of answers.
    - Uses `const` for immutability, ensuring instances are compile-time constants.
  */
  const QuestionModel(this.question, this.answers);

  // Properties:
  final String question; // The question text.
  final List<String> answers; // List of possible answers.

  /*
    getShuffledAnswers():
    - Creates a new list from `answers` (to avoid modifying the original).
    - Shuffles the copied list to randomize answer order.
    - Returns the shuffled list.
  */
  List<String> getShuffledAnswers() {
    List<String> shuffledList = List.of(answers); // Copy the list to preserve original order.
    shuffledList.shuffle(); // Randomize the order.
    return shuffledList; // Return shuffled answers.
  }
}
