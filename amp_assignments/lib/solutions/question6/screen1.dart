import 'package:flutter/material.dart'; // import material package

// Screen1 stateless widget to display images
class Screen1 extends StatelessWidget {
  const Screen1({super.key}); // constructor for Screen1 widget

// build method to create widget
  @override
  Widget build(BuildContext context) {
    // return Scaffold widget with images in row
    return const Scaffold(
        body: Center(
      // center widget to align content
      child: Row(
        // row widget to display images horizontally
        mainAxisAlignment: MainAxisAlignment
            .spaceEvenly, // align images in center with space between
        // images list
        children: [
          // image widget with image from assets
          Expanded(
            // expanded widget to take available space
            child: Image(
              // image widget to display image
              image:
                  AssetImage('assets/virat1.jpg'), // image from assets folder
              fit: BoxFit.cover, // fit image to cover
              height: 150, // height of image
              width: 150, // width of image
            ),
          ),
          SizedBox(
            // sized box widget to add space between images
            width: 10,
          ),
          Expanded(
            // expanded widget to take available space
            child: Image(
              // image widget to display image
              image:
                  AssetImage('assets/virat2.jpg'), // image from assets folder
              fit: BoxFit.cover, // fit image to cover
              height: 150, // height of image
              width: 150, // width of image
            ),
          ),
          SizedBox(
            width: 10, // width of sized box
          ),
          Expanded(
            // expanded widget to take available space
            child: Image(
              // image widget to display image
              image:
                  AssetImage('assets/virat3.jpg'), // image from assets folder
              fit: BoxFit.cover, // fit image to cover
              height: 150, // height of image
              width: 150, // width of image
            ),
          ),
        ],
      ),
    ));
  }
}
