import 'package:amp_assignments/utils/custom_app_bar.dart'; // import custom app bar
import 'package:flutter/material.dart'; // import material package

// Welcome widget to display welcome message and log out button
class Welcome extends StatelessWidget {
  const Welcome({super.key}); // constructor for Welcome widget

// build method to create widget with Scaffold
  @override
  Widget build(BuildContext context) {
    // return Scaffold widget with app bar and welcome message
    return Scaffold(
      // return Scaffold widget with app bar and welcome message
      appBar: const CustomAppBar(
          title: 'Question10 | Welcome'), // custom app bar with title
      body: Container(
        // container widget with gradient background
        decoration: BoxDecoration(
          // box decoration for container
          gradient: RadialGradient(
            // radial gradient for container
            colors: [
              // colors list
              Colors.blue.shade200, // color 1
              Colors.blue.shade400, // color 2
              Colors.blue.shade900, // color 3
            ],
          ),
        ),
        child: Center(
          // center widget to align content
          child: Column(
            // column widget to display content vertically
            mainAxisAlignment:
                MainAxisAlignment.center, // align content in center
            children: [
              // children widgets list
              Text(
                'Welcome User', // welcome message text
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    // text style
                    color:
                        Theme.of(context).colorScheme.onPrimary, // text color
                    fontWeight: FontWeight.bold, // text weight
                    letterSpacing: 5), // letter spacing
              ),
              const SizedBox(
                // sized box widget to add space between widgets
                height: 20,
              ),
              OutlinedButton(
                // outlined button widget to log out
                onPressed: () {
                  // on button press
                  Navigator.pop(context); // navigate to previous screen
                  Navigator.pushNamed(
                      context, '/q10'); // navigate to question 10
                },
                style: OutlinedButton.styleFrom(
                    // button style with border and elevation
                    side: BorderSide(
                        width: 1, color: Colors.blue.shade900), // button border
                    elevation: 10 // button elevation
                    ),
                child: const Text('Log Out'), // button text
              )
            ],
          ),
        ),
      ),
    );
  }
}
