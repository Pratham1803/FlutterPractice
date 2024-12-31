import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const Expenses(),
    ),
  );
}

class NewYear25 extends StatelessWidget {
  const NewYear25({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(      
      backgroundColor: Colors.black,      
      
      body: Center(        
        child: GradientText(
          'Happy New Year\n2025',
          gradient: LinearGradient(
            colors: [Colors.pink, Colors.purple, Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),          
          style: TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.bold,          
          ),
        ),        
      ),    
    );
  }
}

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Gradient gradient;

  const GradientText(
    this.text, {
    super.key,
    required this.gradient,
    this.style = const TextStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return gradient.createShader(
          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
        );
      },
      child: Text(
        text,
        textAlign: TextAlign.center,
        style:
            style.copyWith(color: Colors.white), // Use white for mask blending
      ),
    );
  }
}
