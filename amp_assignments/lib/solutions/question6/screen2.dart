import 'package:flutter/material.dart'; // import material package

// Screen2 stateless widget to display images
class Screen2 extends StatelessWidget {
  const Screen2({super.key}); // constructor for Screen2 widget

// build method to create widget
// returns Scaffold widget with images in column
  @override
  Widget build(BuildContext context) {
    // return Scaffold widget with images in column
    return const Scaffold(
        body: Center(
      // center widget to align content
      child: Padding(
        // padding around content
        padding: EdgeInsets.all(8.0), // padding on all sides
        child: Column(
          // column widget to display images vertically
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // align images in center
          // images list
          children: [
            Expanded(
              // expanded widget to take available space
              child: Image(
                // image widget to display image
                image:
                    AssetImage('assets/virat1.jpg'), // image from assets folder
                height: 250, // height of image
                width:
                    double.infinity, // width of image to take available space
                fit: BoxFit.cover, // fit image to cover
              ),
            ),
            SizedBox(
              // sized box widget to add space between images
              height: 8,
            ),
            Expanded(
              // expanded widget to take available space
              child: Image(
                // image widget to display image
                image:
                    AssetImage('assets/virat2.jpg'), // image from assets folder
                height: 250, // height of image
                width:
                    double.infinity, // width of image to take available space
                fit: BoxFit.cover, // fit image to cover
              ),
            ),
            SizedBox(
              // sized box widget to add space between images
              height: 8,
            ),
            Expanded(
              // expanded widget to take available space
              child: Image(
                // image widget to display image
                image:
                    AssetImage('assets/virat3.jpg'), // image from assets folder
                height: 250, // height of image
                width:
                    double.infinity, // width of image to take available space
                fit: BoxFit.cover, // fit image to cover
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
