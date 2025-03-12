/*
  questions.dart:
  - Defines a list of quiz questions using the `QuestionModel` class.
  - Each question contains a prompt and multiple answer choices.
  - The first answer in each list is the correct answer.

  Features:
  - Uses `const` to ensure the questions list is immutable.
  - Each question is an instance of `QuestionModel`, which stores the question text and answers.
  - Provides structured quiz data for a Flutter quiz app.
*/

import 'package:quiz_app/models/questions.model.dart';

/*
  `questions`: A constant list of `QuestionModel` objects.
  - Contains predefined quiz questions and multiple-choice answers.
  - The first option in the answer list is always the correct one.
*/
const questions = [
  QuestionModel(
    'What are the main building blocks of Flutter UIs?',
    [
      'Widgets', // ✅ Correct Answer
      'Components',
      'Blocks',
      'Functions',
    ],
  ),
  QuestionModel(
    'How are Flutter UIs built?',
    [
      'By combining widgets in code', // ✅ Correct Answer
      'By combining widgets in a visual editor',
      'By defining widgets in config files',
      'By using XCode for iOS and Android Studio for Android',
    ],
  ),
  QuestionModel(
    'What\'s the purpose of a StatefulWidget?',
    [
      'Update UI as data changes', // ✅ Correct Answer
      'Update data as UI changes',
      'Ignore data changes',
      'Render UI that does not depend on data',
    ],
  ),
  QuestionModel(
    'Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
    [
      'StatelessWidget', // ✅ Correct Answer
      'StatefulWidget',
      'Both are equally good',
      'None of the above',
    ],
  ),
  QuestionModel(
    'What happens if you change data in a StatelessWidget?',
    [
      'The UI is not updated', // ✅ Correct Answer
      'The UI is updated',
      'The closest StatefulWidget is updated',
      'Any nested StatefulWidgets are updated',
    ],
  ),
  QuestionModel(
    'How should you update data inside of StatefulWidgets?',
    [
      'By calling setState()', // ✅ Correct Answer
      'By calling updateData()',
      'By calling updateUI()',
      'By calling updateState()',
    ],
  ),
];
