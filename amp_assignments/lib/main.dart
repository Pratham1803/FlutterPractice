import 'package:amp_assignments/routes.dart';
import 'package:amp_assignments/utils/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:amp_assignments/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blue.shade200,
    brightness: Brightness.light,
  ),
  textTheme: GoogleFonts.oswaldTextTheme(),
);

void main() {
  runApp(
    MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      routes: Routes.getRoutes(),
      initialRoute: '/',
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'AMP Practical Assignments',
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: Questions.questions.length,
          itemBuilder: (context, index) => Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  const SizedBox(height: 8),
                  Text(
                    Questions.questions[index],
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: index % 2 == 0
                            ? Theme.of(context).colorScheme.onPrimaryContainer
                            : Theme.of(context).colorScheme.onPrimaryContainer),
                  ),
                ],
              ),
              onTap: () {
                String path = '/q${index + 1}';

                Object arg = Object();
                if (path == '/q5') arg = path;

                Navigator.pushNamed(context, path, arguments: arg);
              },
              tileColor: index % 2 == 0
                  ? Theme.of(context).colorScheme.primaryContainer
                  : Theme.of(context).colorScheme.inversePrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
