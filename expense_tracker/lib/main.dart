import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:expense_tracker/widgets/expenses.dart';

/*
  This file initializes and configures the Flutter application.
  - Defines color schemes for light and dark themes.
  - Sets up MaterialApp with theme settings.
  - Implements a `GradientText` widget for a stylized New Year greeting.

  Features:
  - Custom color schemes for light and dark modes.
  - Theme customization for AppBar, Cards, and Buttons.
  - Optionally locks screen orientation (commented out for now).
  - Implements a `GradientText` widget for displaying text with gradient colors.
*/

// Define a primary color scheme for light mode
var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

// Define a primary color scheme for dark mode
var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

void main() {
  /*
    Optionally locks the screen orientation to portrait mode.
    - `WidgetsFlutterBinding.ensureInitialized();` ensures Flutter is fully initialized before setting constraints.
    - `SystemChrome.setPreferredOrientations([...])` forces portrait mode.
    
    Currently commented out to allow flexibility in orientation.
  */
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((fn) {
  //   runApp(MyApp());
  // });

  runApp(
    MaterialApp(
      /*
        Configuring themes for the app:
        - `theme`: Defines the default light theme.
        - `darkTheme`: Defines the dark mode theme.
        - `themeMode: ThemeMode.system`: Uses the system's theme setting (light/dark mode).
      */
      
      // Dark Theme Configuration
      darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
        colorScheme: kDarkColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
          ),
        ),
      ),

      // Light Theme Configuration
      theme: ThemeData(useMaterial3: true).copyWith(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: kColorScheme.onSecondaryContainer,
            fontSize: 16,
          ),
        ),
      ),

      themeMode: ThemeMode.system, // Follows the system’s dark/light mode setting
      home: const Expenses(), // Launches the `Expenses` screen
    ),
  );
}

/*
  NewYear25 Widget:
  - Displays a "Happy New Year 2025" message with a gradient effect.
  - Uses `GradientText`, a custom widget, to apply the gradient style to the text.
*/
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

/*
  GradientText Widget:
  - A custom text widget that applies a gradient effect to text.
  - Uses `ShaderMask` to blend the gradient onto the text.
*/
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
        style: style.copyWith(color: Colors.white), // White text for blending effect
      ),
    );
  }
}
