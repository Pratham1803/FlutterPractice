import 'package:flutter/material.dart';

class TextStyleClass extends StatelessWidget {
  final String text;
  final String textType;
  final Color color;

  const TextStyleClass(this.text,
      {this.textType = '', this.color = Colors.white, super.key});
  @override
  Widget build(BuildContext context) {
    if (textType == 'heading') {
      return Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(          
            color: color,
            fontSize: 28,
            fontWeight: FontWeight.bold,            
            decorationThickness: 0,
            fontFamily: 'arial'),
      );
    } else {
      return Text(
        text,
        style: TextStyle(
            color: color, fontSize: 16, fontFamily: 'arial'),
      );
    }
  }
}
