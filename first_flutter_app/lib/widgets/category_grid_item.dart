// Importing the Category model to use category properties (title, icon, etc.).
import 'package:first_flutter_app/models/category.dart';

// Importing Flutter's material design package for UI components.
import 'package:flutter/material.dart';

// A stateless widget representing an item in the category grid.
class CategoryGridItem extends StatelessWidget {
  // Constructor to initialize the category and the selection callback function.
  const CategoryGridItem({
    super.key,
    required this.category, // The category data (title, icon, etc.).
    required this.onCategorySelect, // Function to handle category selection.
  });

  final Category category; // Holds category properties (title, icon).
  final Function() onCategorySelect; // Callback function when a category is tapped.

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCategorySelect, // Calls the provided function when tapped.
      splashColor: Theme.of(context).primaryColor, // Ripple effect on tap.
      borderRadius: BorderRadius.circular(16), // Rounds the edges on tap effect.

      // Container for styling and layout.
      child: Container(
        padding: const EdgeInsets.all(16), // Adds padding inside the container.
        decoration: BoxDecoration(
          color: Colors.blue, // Background color for the category item.
          borderRadius: BorderRadius.circular(10), // Rounds the corners.
          border: Border.all(color: Colors.white, width: 2), // White border.
        ),

        // Column to arrange the icon and text vertically.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centers content.
          children: [
            Icon(
              category.icon, // Displays category's icon.
              size: 50, // Icon size.
              color: Colors.white, // Icon color.
            ),

            // Displays the category title.
            Text(
              category.title, // Category title text.
              style: Theme.of(context).textTheme.titleMedium!.copyWith(),
            ),
          ],
        ),
      ),
    );
  }
}
