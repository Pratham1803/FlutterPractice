// Importing necessary Flutter packages for building the UI.
import 'package:flutter/material.dart';

// Importing custom files that define screens for categories and login.
import 'package:first_flutter_app/categories.dart';
import 'package:first_flutter_app/login.dart'; // Import your login screen

// The main function is the entry point of the Flutter application.
void main() {
  runApp(const MyApp()); // Runs the app by calling the MyApp widget.
}

// Defining the main application widget using StatelessWidget.
// StatelessWidget means that this widget does not maintain any internal state.
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor with a constant key for optimization.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the debug banner in debug mode.

      home: const MyLogin(), // Sets the initial screen of the app to MyLogin.

      routes: {
        // Defining named routes for navigation.
        // The 'categories' route will navigate to CategoriesScreen.
        'categories': (context) => const CategoriesScreen(),
      },
    );
  }
}
