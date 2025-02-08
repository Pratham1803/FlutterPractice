import 'package:first_flutter_app/data/main_screen_data.dart';
import 'package:first_flutter_app/widgets/category_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/screens/profile.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void selectCategory(BuildContext context, String categoryId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Profile(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              // CircleAvatar automatically clips into a circle
              radius: 15, // Adjust size
              backgroundImage: AssetImage('assets/SELF.jpg'),
            ),
            SizedBox(width: 10),
            Text(
              'Dashboard',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ), // Adds spacing
            child: Text(
              'Welcome Akshat Shah!!',
              style: TextStyle(fontSize: 25),
            ),
          ),
          Expanded(
            // Ensures GridView takes remaining space
            child: GridView(
              padding: const EdgeInsets.all(2),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 5 / 1.7,
                crossAxisSpacing: 25,
                mainAxisSpacing: 15,
              ),
              children: [
                for (final category in availableCategories)
                  CategoryGridItem(category: category, onCategorySelect: () => selectCategory(context, category.id)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
