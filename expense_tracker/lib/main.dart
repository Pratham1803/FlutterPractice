import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:expense_tracker/widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);
var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);
void main() {
  // Lock the Screen orientation
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((fn) {
  //   runApp(
  //     MaterialApp(
  //       darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
  //         colorScheme: kDarkColorScheme,
  //         cardTheme: const CardTheme().copyWith(
  //           color: kDarkColorScheme.secondaryContainer,
  //           margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
  //         ),
  //         elevatedButtonTheme: ElevatedButtonThemeData(
  //           style: ElevatedButton.styleFrom(
  //               backgroundColor: kDarkColorScheme.primaryContainer),
  //         ),
  //       ),
  //       theme: ThemeData(useMaterial3: true).copyWith(
  //         colorScheme: kColorScheme,
  //         appBarTheme: const AppBarTheme().copyWith(
  //           backgroundColor: kColorScheme.onPrimaryContainer,
  //           foregroundColor: kColorScheme.primaryContainer,
  //         ),
  //         cardTheme: const CardTheme().copyWith(
  //           color: kColorScheme.secondaryContainer,
  //           margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
  //         ),
  //         elevatedButtonTheme: ElevatedButtonThemeData(
  //           style: ElevatedButton.styleFrom(
  //               backgroundColor: kColorScheme.primaryContainer),
  //         ),
  //         textTheme: ThemeData().textTheme.copyWith(
  //               titleLarge: TextStyle(
  //                 fontWeight: FontWeight.bold,
  //                 color: kColorScheme.onSecondaryContainer,
  //                 fontSize: 16,
  //               ),
  //             ),
  //       ),
  //       themeMode: ThemeMode.system,
  //       home: const Expenses(),
  //     ),
  //   );
  // });
  
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
        colorScheme: kDarkColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kDarkColorScheme.primaryContainer),
        ),
      ),
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
              backgroundColor: kColorScheme.primaryContainer),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 16,
              ),
            ),
      ),
      themeMode: ThemeMode.system,
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
