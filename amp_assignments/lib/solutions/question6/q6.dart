import 'package:amp_assignments/solutions/question6/screen1.dart'; // import screen1.dart
import 'package:amp_assignments/solutions/question6/screen2.dart'; // import screen2.dart
import 'package:amp_assignments/utils/custom_app_bar.dart'; // import custom app bar
import 'package:flutter/material.dart'; // import material package

// Question6 widget to display tab bar with two screens
class Question6 extends StatelessWidget {
  const Question6({super.key}); // constructor for Question6 widget

// build method to create widget
// returns DefaultTabController widget with length 2 and Scaffold widget
  @override
  Widget build(BuildContext context) {
    // return DefaultTabController widget with length 2
    return const DefaultTabController(
      length: 2, // number of tabs
      // Scaffold widget with custom app bar and tab bar view
      child: Scaffold(
        // custom app bar with title and tab bar
        appBar: CustomAppBar(
          title: 'TabBar Example', // title of app bar
          // tab bar with two tabs
          tabBar: TabBar( // tab bar widget
          // tabs list
            tabs: [
              Tab(
                text: 'Screen 1',
              ), // tab 1 with text 'Screen 1'
              Tab(
                text: 'Screen 2', // tab 2 with text 'Screen 2'
              ),
            ],
          ),
        ),
        body: TabBarView( // tab bar view widget
          // children widgets in tab bar view
          children: [
            Screen1(), // screen1 widget
            Screen2(), // screen2 widget
          ],
        ),
      ),
    );
  }
}
