import 'package:amp_assignments/utils/custom_app_bar.dart'; // import custom app bar
import 'package:flutter/material.dart'; // import material package

// Question9 widget to display images using Image and FadeInImage
class Question9 extends StatelessWidget {
  const Question9({super.key}); // constructor for Question9 widget

// build method to create widget with Scaffold
  @override
  Widget build(BuildContext context) {
    // return Scaffold widget with app bar and images
    return Scaffold(
      appBar: const CustomAppBar(
          title: 'Question9 | Images'), // custom app bar with title
      // scrollable column widget with images
      body: SingleChildScrollView(
        // scrollable column widget
        child: Padding(
          // padding around content
          padding: const EdgeInsets.all(16.0), // padding on all sides
          child: Column(
            // column widget to display images vertically
            crossAxisAlignment:
                CrossAxisAlignment.stretch, // align images in center of screen
            // images list
            children: [
              _buildImageCard(
                // method to build image card
                context: context, // context of widget
                title: 'PNG IMAGE', // title of image
                imagePath: 'assets/pratham.png', // image path
              ),
              const SizedBox(height: 16), // sized box with height 16
              _buildImageCard(
                // method to build image card
                context: context, // context of widget
                title: 'JPG IMAGE', // title of image
                imagePath: 'assets/virat1.jpg', // image path
              ),
              const SizedBox(height: 16), // sized box with height 16
              _buildImageCard(
                // method to build image card
                context: context, // context of widget
                title: 'GIF IMAGE', // title of image
                imagePath: 'assets/sunflowers.gif', // image path
              ),
              const SizedBox(height: 16), // sized box with height 16
              _buildNetworkImageCard(
                // method to build network image card
                context: context, // context of widget
                title: 'NETWORK IMAGE', // title of image
                imageUrl:
                    'https://www.charusat.ac.in/_next/static/media/c2.2dc1f03c.jpg', // image url
                placeholder: "Charusat", // placeholder image path
              ),
            ],
          ),
        ),
      ),
    );
  }

// method to build image card with title and image path
  Widget _buildImageCard({
    required BuildContext context, // context of widget
    required String title, // title of image
    required String imagePath, // image path
  }) {
    return Card(
      // card widget to display image
      elevation: 4, // elevation of card widget
      shape: RoundedRectangleBorder(
        // border shape of card
        borderRadius: BorderRadius.circular(8), // border radius of card
      ),
      child: Padding(
        // padding around content
        padding: const EdgeInsets.all(16.0), // padding on all sides
        child: Column(
          // column widget to display content vertically
          // content list
          children: [
            Text(
              title, // title of image
              style: Theme.of(context).textTheme.titleLarge, // text style
            ), // text widget with title
            const SizedBox(height: 8), // sized box with height 8
            Image(
              // image widget to display image
              image: AssetImage(imagePath), // image from assets folder
              height: 250, // height of image
              width: 250, // width of image
              fit: BoxFit.contain, // fit image to contain in box
            ),
          ],
        ),
      ),
    );
  }

// method to build network image card with title and image url
  Widget _buildNetworkImageCard({
    required BuildContext context, // context of widget
    required String title, // title of image
    required String imageUrl, // image url
    required String placeholder, // placeholder image path
  }) {
    return Card(
      // card widget to display image
      elevation: 4, // elevation of card widget
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)), // border shape of card
      child: Padding(
        // padding around content
        padding: const EdgeInsets.all(16.0), // padding on all sides
        child: Column(
          // column widget to display content vertically
          children: [
            // content list
            Text(
              // text widget with title
              title, // title of image
              style: Theme.of(context).textTheme.titleLarge, // text style
            ),
            const SizedBox(height: 8), // sized box with height 8
            FadeInImage.assetNetwork(
              // fade in image widget to display image
              placeholder: placeholder, // placeholder image path
              image: imageUrl, // image url
              height: 250, // height of image
              width: 250, // width of image
              fit: BoxFit.contain, // fit image to contain in box
            ),
          ],
        ),
      ),
    );
  }
}
