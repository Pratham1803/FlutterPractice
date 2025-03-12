import 'package:amp_assignments/utils/custom_app_bar.dart'; // import custom app bar
import 'package:flutter/material.dart'; // import material package

// Error message widget to display error message
class Errormsg extends StatelessWidget {
  const Errormsg({super.key}); // constructor for Errormsg widget

// build method to create widget with Scaffold
  @override
  Widget build(BuildContext context) {
    // return Scaffold widget with app bar and error message
    return Scaffold(
      // scaffold widget
      appBar: const CustomAppBar(
          title: 'Question10 | Error'), // custom app bar with title
      body: Container(
        // container widget
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
              // error message text
              Text(
                'Invalid Credentials', // error message text
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
                // outlined button widget to try again
                onPressed: () {
                  //  on button press
                  Navigator.pop(context); // navigate to previous screen
                  Navigator.pushNamed(
                      context, '/q10'); // navigate to question 10
                },
                style: OutlinedButton.styleFrom(
                    // button style with border and elevation
                    side: BorderSide(
                        width: 1,
                        color: Colors.blue.shade900), // button border style
                    elevation: 10), // button elevation
                child: const Text('Try Again'), // button text
              )
            ],
          ),
        ),
      ),
    );
  }
}
