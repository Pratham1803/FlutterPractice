import 'package:flutter/material.dart';
import 'package:first_flutter_app/categories.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final TextEditingController studidcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  final String correctStudId = '1111';
  final int correctPass = 1111;

  void _login() {
    String enteredId = studidcontroller.text;
    String enteredPass = passwordcontroller.text;

    // Convert password to integer safely
    int? enteredPassInt = int.tryParse(enteredPass);

    if (enteredId == correctStudId && enteredPassInt == correctPass) {
      // Successful login -> Navigate to CategoriesScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const CategoriesScreen()),
      );
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid Student ID OR Password!"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 120),
              Center(
                child: Image.asset(
                  'assets/ch1.png',
                  height: 120,
                  width: 120,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 50),

              // Student ID TextField
              TextField(
                controller: studidcontroller,
                decoration: const InputDecoration(
                  labelText: 'Student Id',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person_outline),
                ),
              ),
              const SizedBox(height: 15),

              // Password TextField
              TextField(
                controller: passwordcontroller,
                obscureText: true,
                keyboardType: TextInputType.number, // Ensures only numbers can be entered
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 20),

              // Login Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _login, // Call login function
                  child: const Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
