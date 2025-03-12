// Importing required packages.
import 'package:amp_assignments/routes.dart'; // Custom routes file for navigation.
import 'package:amp_assignments/utils/custom_app_bar.dart'; // Custom AppBar widget.
import 'package:flutter/material.dart'; // Flutter's core UI library.
import 'package:amp_assignments/data/questions.dart'; // Questions data file.
import 'package:google_fonts/google_fonts.dart'; // Package for custom Google Fonts.

/// Defining a global `ThemeData` object to style the app consistently.
ThemeData theme = ThemeData(
  brightness: Brightness.light, // Set the theme to light mode.
  useMaterial3: true, // Enable Material 3 design.
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blue.shade200, // Generate color scheme from a seed color.
    brightness: Brightness.light, // Keep it light-themed.
  ),
  textTheme: GoogleFonts.oswaldTextTheme(), // Apply Google Oswald font for text.
);

/// **Main Function** - Entry point of the Flutter app.
void main() {
  runApp(
    MaterialApp(
      theme: theme, // Apply the custom theme.
      debugShowCheckedModeBanner: false, // Hide the debug banner.
      routes: Routes.getRoutes(), // Load predefined routes.
      initialRoute: '/', // Define the initial route when the app starts.
    ),
  );
}

/// **MyApp** - A StatelessWidget that represents the home screen.
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor with an optional key.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Custom App Bar defined in `custom_app_bar.dart`
      appBar: const CustomAppBar(
        title: 'AMP Practical Assignments', // AppBar title.
      ),

      /// The body consists of a `Padding` widget wrapping a `ListView.builder`
      body: Padding(
        padding: const EdgeInsets.all(12.0), // Add padding around the ListView.
        child: ListView.builder(
          itemCount: Questions.questions.length, // Total number of questions.
          itemBuilder: (context, index) => Card(
            elevation: 4, // Adds shadow to the card for a 3D effect.
            margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Rounded corners.
            ),

            /// `ListTile` displays each question inside a card.
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 16),

              /// Column to display the question number and question text.
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Displays the question number dynamically.
                  Text(
                    "Question ${index + 1}",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: index % 2 == 0
                              ? Theme.of(context).colorScheme.onPrimaryContainer
                              : Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                        ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 8), // Space between title and text.

                  /// Displays the actual question from the list.
                  Text(
                    Questions.questions[index],
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: index % 2 == 0
                            ? Theme.of(context).colorScheme.onPrimaryContainer
                            : Theme.of(context).colorScheme.onPrimaryContainer),
                  ),
                ],
              ),

              /// When the user taps a question, navigate to the corresponding page.
              onTap: () {
                String path = '/q${index + 1}'; // Generate route path dynamically.

                Object arg = Object();
                if (path == '/q5') arg = path; // Pass argument only for question 5.

                Navigator.pushNamed(context, path, arguments: arg); // Navigate.
              },

              /// Alternates background color for better readability.
              tileColor: index % 2 == 0
                  ? Theme.of(context).colorScheme.primaryContainer
                  : Theme.of(context).colorScheme.inversePrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // Rounded corners.
              ),
            ),
          ),
        ),
      ),
    );
  }
}
