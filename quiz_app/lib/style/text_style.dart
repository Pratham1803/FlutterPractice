import 'package:flutter/material.dart';

// import 'package:google_fonts/google_fonts.dart'; 
// (This can be uncommented if Google Fonts are to be used in the future)

/*
  TextStyleClass:
  A reusable StatelessWidget that applies custom text styling.
  
  Features:
  - Supports different text styles, including a 'heading' style.
  - Allows for customizable text color.
  - Uses an Opacity widget to make text slightly transparent.
  
  Parameters:
  - text: The actual text to display.
  - textType: Determines whether the text should be styled as a heading.
  - color: Defines the text color (default is white).
*/
class TextStyleClass extends StatelessWidget {
  // Properties: text content, type of text, and color
  final String text;
  final String textType;
  final Color color;

  /*
    Constructor:
    - Requires a text string.
    - Optional parameters:
      - textType: Defaults to an empty string (""), used to determine styling.
      - color: Defaults to white.
  */
  const TextStyleClass(
    this.text, {
    this.textType = '',
    this.color = Colors.white,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    /*
      If textType is 'heading', apply a bold, larger font size.
      Otherwise, apply a normal font style with a smaller size.
    */
    if (textType == 'heading') {
      return Opacity(
        opacity: 0.7, // Makes the text 70% visible
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: color, // Uses the specified text color
            fontSize: 24, // Larger font size for headings
            fontWeight: FontWeight.bold, // Makes the heading bold
            decorationThickness: 0, // Ensures no underline thickness
          ),
        ),
      );
    } else {
      return Opacity(
        opacity: 0.7, // Makes the text 70% visible
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: color, // Uses the specified text color
            fontSize: 16, // Standard font size for normal text
            decorationThickness: 0, // Ensures no underline thickness
          ),
        ),
      );
    }
  }
}
