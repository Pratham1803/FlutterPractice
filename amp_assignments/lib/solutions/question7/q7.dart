import 'package:amp_assignments/utils/custom_app_bar.dart'; // import custom app bar
import 'package:flutter/material.dart'; // import material package

// Question7 widget to display buttons to navigate to different screens
class Question7 extends StatelessWidget {
  const Question7({super.key}); // constructor for Question7 widget

  // build method to create widget with Scaffold
  @override
  Widget build(BuildContext context) {
    // return Scaffold widget with app bar and buttons
    return Scaffold(
      appBar: const CustomAppBar(title: 'Question 7'), // custom app bar
      body: Center( // center widget to align content
        child: Container( // container widget to add padding and decoration
          padding: const EdgeInsets.all(40), // padding around content 
          decoration: BoxDecoration( // box decoration for container widget
            border: Border.all(), // border around container
            color: Theme.of(context).colorScheme.surfaceTint, // background color of container
            borderRadius: const BorderRadius.all( // border radius of container 
              Radius.elliptical(5, 15), // radius of border 
            ),
            boxShadow: const [ // box shadow for container
              BoxShadow( // box shadow properties
                color: Colors.black26, // shadow color
                blurRadius: 8, // blur radius of shadow
                offset: Offset(2, 4), // offset of shadow from container
              ),
            ],
          ),
          child: Column( // column widget to display content vertically
            mainAxisAlignment: MainAxisAlignment.center, // align content in center 
            mainAxisSize: MainAxisSize.min, // set main axis size to minimum 
            // buttons list 
            children: [
              ElevatedButton( // elevated button widget 
                onPressed: () { // on button press 
                  Navigator.pushNamed(context, '/q7/s2'); // navigate to screen 2
                },
                // button style with background color, padding and shape
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Theme.of(context).colorScheme.onInverseSurface, // button background color
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15), // button padding 
                  shape: const RoundedRectangleBorder( // button shape 
                    borderRadius: BorderRadius.horizontal( // border radius of button
                      left: Radius.circular(10), // left border radius
                    ),
                  ),
                ),
                child: const Text('Screen 2'), // button text 
              ),
              const SizedBox( // sized box widget to add space between buttons
                height: 20, 
              ),
              ElevatedButton( // elevated button widget
                onPressed: () { // on button press
                  Navigator.pushNamed(context, '/q7/s3'); // navigate to screen 3
                },
                // button style with background color, padding and shape
                style: ElevatedButton.styleFrom( 
                  backgroundColor:
                      Theme.of(context).colorScheme.onInverseSurface, // button background color
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15), // button padding
                  shape: const RoundedRectangleBorder( // button shape
                    borderRadius: BorderRadius.all( // border radius of button
                      Radius.circular(10), // border radius
                    ),
                  ),
                ),
                child: const Text('Screen 3'), // button text
              ),
              const SizedBox( // sized box widget to add space between buttons
                height: 20,
              ),
              ElevatedButton( // elevated button widget
                onPressed: () { // on button press
                  Navigator.pushNamed(context, '/q7/s4'); // navigate to screen 4
                },
                
                style: ElevatedButton.styleFrom( // button style with background color, padding and shape
                  backgroundColor: 
                      Theme.of(context).colorScheme.onInverseSurface, // button background color
                  padding: 
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15), // button padding
                  shape: const RoundedRectangleBorder( // button shape 
                    borderRadius: BorderRadius.horizontal( // border radius of button
                      right: Radius.circular(10), // right border radius
                    ),
                  ),
                ),
                child: const Text('Screen 4'), // button text
              ),
            ],
          ),
        ),
      ),
    );
  }
}
