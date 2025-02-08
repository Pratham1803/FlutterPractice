import 'package:flutter/material.dart';
import 'package:first_flutter_app/categories.dart';
import 'package:first_flutter_app/login.dart'; // Import your login screen

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyLogin(),
      routes: {
        'categories': (context) => const CategoriesScreen(),
      },
    );
  }
}
