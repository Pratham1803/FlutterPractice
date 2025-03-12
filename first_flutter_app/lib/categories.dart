// Importing necessary Flutter files and widgets.
import 'package:first_flutter_app/data/main_screen_data.dart'; // Importing data source for categories.
import 'package:first_flutter_app/widgets/category_grid_item.dart'; // Importing custom grid item widget.
import 'package:flutter/material.dart'; // Flutter material UI package.
import 'package:first_flutter_app/screens/profile.dart'; // Importing the Profile screen.

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key}); // Constructor with a constant key for optimization.

  // Function to handle category selection and navigate to the Profile screen.
  void selectCategory(BuildContext context, String categoryId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Profile(), // Navigates to Profile screen when a category is selected.
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // Sets the app bar color.
        title: const Row(
          mainAxisSize: MainAxisSize.min, // Ensures Row takes only required space.
          children: [
            CircleAvatar(
              radius: 15, // Adjusts the avatar size.
              backgroundImage: AssetImage('assets/SELF.jpg'), // Loads an image from assets.
            ),
            SizedBox(width: 10), // Adds spacing between avatar and text.
            Text(
              'Dashboard',
              style: TextStyle(color: Colors.white), // White text for contrast.
            ),
          ],
        ),
      ),

      // Body containing a welcome message and a grid of categories.
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10), // Adds horizontal and vertical padding.
            child: Text(
              'Welcome Akshat Shah!!', // Displays the user's name.
              style: TextStyle(fontSize: 25), // Text styling.
            ),
          ),
          
          // GridView to display category items dynamically.
          Expanded(
            child: GridView(
              padding: const EdgeInsets.all(2), // Adds padding around the grid.
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, // Defines the number of columns (1 item per row).
                childAspectRatio: 5 / 1.7, // Adjusts item size ratio.
                crossAxisSpacing: 25, // Spacing between columns (not needed for 1 column).
                mainAxisSpacing: 15, // Spacing between rows.
              ),
              children: [
                for (final category in availableCategories)
                  // Creating a grid item for each category.
                  CategoryGridItem(
                    category: category,
                    onCategorySelect: () => selectCategory(context, category.id), // Calls the navigation function.
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
