// Importing Flutter's material design package for UI components.
import 'package:flutter/material.dart';

// Profile screen as a stateless widget (since it does not require dynamic updates).
class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar with a blue background.
      appBar: AppBar(
        backgroundColor: Colors.blue, // Sets the app bar color.
        title: const Row(
          children: [
            CircleAvatar(
              radius: 15, // Sets size of the profile image.
              backgroundImage: AssetImage('assets/SELF.jpg'), // Loads an image from assets.
            ),
            SizedBox(width: 10), // Adds spacing between avatar and text.
            Text(
              'Profile',
              style: TextStyle(color: Colors.white), // Sets text color to white.
            ),
          ],
        ),
      ),

      // Body of the profile screen.
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16, // Adds horizontal padding.
              vertical: 16, // Adds vertical padding.
            ),
          ),

          // Large profile picture in the center.
          CircleAvatar(
            radius: 50, // Sets size of the large profile image.
            backgroundImage: AssetImage('assets/SELF.jpg'), // Loads the same profile image.
          ),
        ],
      ),
    );
  }
}
