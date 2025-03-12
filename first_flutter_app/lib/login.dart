// Importing necessary Flutter package for UI components.
import 'package:flutter/material.dart';

// Importing the CategoriesScreen, which will be navigated to upon successful login.
import 'package:first_flutter_app/categories.dart';

// Defining a stateful widget for the login screen.
class MyLogin extends StatefulWidget {
  const MyLogin({super.key}); // Constructor with a constant key for optimization.

  @override
  State<MyLogin> createState() => _MyLoginState(); // Creates the mutable state.
}

// The state class for MyLogin widget.
class _MyLoginState extends State<MyLogin> {
  // Controllers for handling text input in Student ID and Password fields.
  final TextEditingController studidcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  // Hardcoded correct credentials for login validation.
  final String correctStudId = '1111'; // Correct Student ID.
  final int correctPass = 1111; // Correct Password (as an integer).

  // Function to handle login authentication.
  void _login() {
    // Retrieving user input from the text fields.
    String enteredId = studidcontroller.text;
    String enteredPass = passwordcontroller.text;

    // Convert entered password to integer safely.
    int? enteredPassInt = int.tryParse(enteredPass);

    // Checking if entered credentials match the predefined correct ones.
    if (enteredId == correctStudId && enteredPassInt == correctPass) {
      // If credentials are correct, navigate to CategoriesScreen and replace current screen.
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const CategoriesScreen()),
      );
    } else {
      // If credentials are incorrect, show an error message using a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid Student ID OR Password!"),
          backgroundColor: Colors.red, // Red background for error indication.
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Sets the background color of the screen.

      body: SingleChildScrollView( // Ensures the UI is scrollable in case of small screens.
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30), // Adds padding to the screen.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centers elements vertically.
            children: [
              const SizedBox(height: 120), // Adds space at the top.

              // Centered logo/image at the top.
              Center(
                child: Image.asset(
                  'assets/ch1.png', // Image from assets folder.
                  height: 120, // Set height.
                  width: 120, // Set width.
                  fit: BoxFit.contain, // Ensures the image is fully visible.
                ),
              ),

              const SizedBox(height: 50), // Space below the image.

              // Student ID Input Field.
              TextField(
                controller: studidcontroller, // Controller to get user input.
                decoration: const InputDecoration(
                  labelText: 'Student Id', // Label inside the text field.
                  border: OutlineInputBorder(), // Adds a border around the text field.
                  prefixIcon: Icon(Icons.person_outline), // Icon inside the text field.
                ),
              ),

              const SizedBox(height: 15), // Space between fields.

              // Password Input Field.
              TextField(
                controller: passwordcontroller, // Controller to get user input.
                obscureText: true, // Hides input for password security.
                keyboardType: TextInputType.number, // Ensures only numbers can be entered.
                decoration: const InputDecoration(
                  labelText: 'Password', // Label inside the text field.
                  border: OutlineInputBorder(), // Adds a border around the text field.
                  prefixIcon: Icon(Icons.lock), // Lock icon for password field.
                ),
              ),

              const SizedBox(height: 20), // Space before the button.

              // Login Button.
              SizedBox(
                width: double.infinity, // Makes the button stretch to full width.
                child: ElevatedButton(
                  onPressed: _login, // Calls the _login function when pressed.
                  child: const Text('Login'), // Button label.
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
