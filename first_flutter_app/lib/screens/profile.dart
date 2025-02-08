import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar.
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Row(
          children: [
            CircleAvatar(
              radius: 15, //img Size
              backgroundImage: AssetImage('assets/SELF.jpg'),
            ),
            SizedBox(width: 10),
            Text(
              'Profile',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),

      //Body Part
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
          ),
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/SELF.jpg'),
          ),
        ], //Children
      ),
    );
  }
}
