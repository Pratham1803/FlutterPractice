import 'package:amp_assignments/utils/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'dart:io'; // Required for exiting the app.

/// **Question1 Widget**
/// - Displays a screen with a custom `AppBar` and a side navigation `Drawer`.
/// - Navigates to different screens based on user selection.
/// - Handles arguments passed via navigation.
class Question1 extends StatelessWidget {
  const Question1({super.key});

  @override
  Widget build(BuildContext context) {
    // **Retrieve arguments passed from the previous screen**
    final data = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      // **Custom AppBar with Dynamic Title**
      appBar: CustomAppBar(
        title: data == '/q5' ? 'Program 5' : 'Program 1', // Adjusts title based on passed argument.
      ),

      // **End Drawer (Side Navigation Drawer)**
      endDrawer: Drawer(
        child: ListView(
          children: [
            // **Back Button Row (Closes the Drawer)**
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context); // Closes the drawer when tapped.
                  },
                  alignment: Alignment.topLeft,
                  icon: const Icon(Icons.arrow_back),
                ),
                const Spacer(), // Pushes remaining content to the right.
              ],
            ),

            // **Drawer Header (User Info)**
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 40, // Profile picture size
                    backgroundImage: AssetImage('assets/pratham.png'), // Local image asset.
                  ),
                  const SizedBox(height: 11), // Space between avatar and text.
                  Text(
                    '24MCA143', // User ID or identifier.
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface, // Adjusts text color based on theme.
                        ),
                  ),
                ],
              ),
            ),

            // **Navigation ListTile Items**
            // **Interest Calculator Navigation**
            ListTile(
              leading: Icon(
                Icons.calculate,
                color: Theme.of(context).colorScheme.onBackground, // Theme-based color.
              ),
              title: const Text('Interest Calculator'),
              onTap: () {
                Navigator.pop(context); // Closes the drawer.
                if (data == '/q5') {
                  Navigator.pushNamed(context, '/q2'); // Navigates to Interest Calculator screen.
                }
              },
            ),

            // **MinMax Navigation**
            ListTile(
              leading: Icon(
                Icons.upcoming_sharp,
                color: Theme.of(context).colorScheme.onBackground,
              ),
              title: const Text('MinMax'),
              onTap: () {
                Navigator.pop(context);
                if (data == '/q5') {
                  Navigator.pushNamed(context, '/q3'); // Navigates to MinMax screen.
                }
              },
            ),

            // **Order Food Navigation**
            ListTile(
              leading: Icon(
                Icons.delivery_dining,
                color: Theme.of(context).colorScheme.onBackground,
              ),
              title: const Text('Order Food'),
              onTap: () {
                Navigator.pop(context);
                if (data == '/q5') {
                  Navigator.pushNamed(context, '/q4'); // Navigates to Order Food screen.
                }
              },
            ),

            // **Divider (Separates Navigation and Exit Option)**
            const Divider(),

            // **Exit App Button**
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Theme.of(context).colorScheme.onBackground,
              ),
              title: const Text('Exit'),
              onTap: () {
                exit(0); // **Forcefully exits the application** (only works on native platforms, not web).
              },
            ),
          ],
        ),
      ),
    );
  }
}
