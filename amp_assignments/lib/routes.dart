// Importing required Flutter and app-specific files.
import 'package:amp_assignments/main.dart'; // Main application file.
import 'package:amp_assignments/solutions/question1/q1.dart'; // Solution for Question 1.
import 'package:amp_assignments/solutions/question10/errormsg.dart'; // Error message screen for Question 10.
import 'package:amp_assignments/solutions/question10/login.dart'; // Login screen for Question 10.
import 'package:amp_assignments/solutions/question10/welcome.dart'; // Welcome screen for Question 10.
import 'package:amp_assignments/solutions/question11/q11.dart'; // Solution for Question 11.
import 'package:amp_assignments/solutions/question12/q12.dart'; // Solution for Question 12.
import 'package:amp_assignments/solutions/question2/interest.dart'; // Interest calculator (Q2).
import 'package:amp_assignments/solutions/question3/minmax.dart'; // Min-Max finder (Q3).
import 'package:amp_assignments/solutions/question4/orderfood.dart'; // Food ordering app (Q4).
import 'package:amp_assignments/solutions/question6/Q6.dart'; // Solution for Question 6.
import 'package:amp_assignments/solutions/question7/q7.dart'; // Main screen for Question 7.
import 'package:amp_assignments/solutions/question7/screen2.dart'; // Screen 2 for Q7.
import 'package:amp_assignments/solutions/question7/screen3.dart'; // Screen 3 for Q7.
import 'package:amp_assignments/solutions/question7/screen4.dart'; // Screen 4 for Q7.
import 'package:amp_assignments/solutions/question8/q8.dart'; // Solution for Question 8.
import 'package:amp_assignments/solutions/question9/q9.dart'; // Solution for Question 9.
import 'package:flutter/material.dart'; // Flutter's core UI library.

/// **Routes Class**
/// This class defines all the named routes for the application.
class Routes {
  
  /// Returns a **map of routes** where:
  /// - The **key** is a string representing the route name.
  /// - The **value** is a function returning a `Widget` (screen).
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/': (context) => const MyApp(), // Home screen of the app.

      // 🚀 Routes for each question's solution
      '/q1': (context) => const Question1(), // Q1: Some solution
      '/q2': (context) => const Interest(), // Q2: Interest Calculator
      '/q3': (context) => const Minmax(), // Q3: Find min and max numbers
      '/q4': (context) => const OrderFood(), // Q4: Food ordering app
      '/q5': (context) => const Question1(), // Q5: Redirects to Q1 (Possible mistake?)
      '/q6': (context) => const Question6(), // Q6: Solution for question 6

      // 🚀 Q7 has multiple screens
      '/q7': (context) => const Question7(), // Q7: Main screen
      '/q7/s2': (context) => const Screen2(), // Q7: Screen 2
      '/q7/s3': (context) => const Screen3(), // Q7: Screen 3
      '/q7/s4': (context) => const Screen4(), // Q7: Screen 4

      '/q8': (context) => const Question8(), // Q8: Some solution
      '/q9': (context) => const Question9(), // Q9: Some solution
      '/q10': (context) => const Question10(), // Q10: Main screen
      '/q10/welcome': (context) => const Welcome(), // Q10: Welcome screen
      '/q10/errorMsg': (context) => const Errormsg(), // Q10: Error message screen

      '/q11': (context) => const Question11(), // Q11: Some solution
      '/q12': (context) => const Question12(), // Q12: Some solution
    };
  }
}
