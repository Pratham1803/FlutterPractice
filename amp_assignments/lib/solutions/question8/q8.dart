import 'package:amp_assignments/utils/custom_app_bar.dart'; // import custom app bar
import 'package:flutter/material.dart'; // import material package

// Question8 widget to display list of items using ListView
class Question8 extends StatelessWidget {
  const Question8({super.key}); // constructor for Question8 widget

// build method to create widget with Scaffold
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // return Scaffold widget with app bar and list view
      appBar: const CustomAppBar(
          title: 'Question8 | ListView'), // custom app bar with title
      // list view builder widget with 25 items
      body: ListView.builder(
        // list view builder widget
        itemCount: 25, // number of items in list view
        // item builder to create list items with ListTile
        itemBuilder: (context, index) => Column(
          // method to build list items
          children: [
            // children widgets in column
            ListTile(
              // list tile widget to display list items
              // list tile properties
              title: Text('Item Number ${index + 1}'), // title of list tile
              trailing:
                  const Icon(Icons.arrow_right), // trailing icon of list tile
              subtitle: Text(
                  'Here is The Item Number ${index + 1}'), // subtitle of list tile
            ),
            const Divider() // divider between list items
          ],
        ),
      ),
    );
  }
}
