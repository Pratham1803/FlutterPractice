import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class TextStyleClass extends StatelessWidget {
  final String text;
  final String textType;
  final Color color;

  const TextStyleClass(this.text,
      {this.textType = '', this.color = Colors.white, super.key});
  @override
  Widget build(BuildContext context) {
    if (textType == 'heading') {
      return Opacity(
        opacity: 0.7,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: color,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            decorationThickness: 0,
          ),
        ),
      );
    } else {
      return Opacity(
        opacity: 0.7,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: color,
            fontSize: 16,
            decorationThickness: 0,
          ),
        ),
      );
    }
  }
}