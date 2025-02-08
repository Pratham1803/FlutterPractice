import 'package:first_flutter_app/models/category.dart';
// import 'package:charusat/data/main_screen_data.dart';
import 'package:flutter/material.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.onCategorySelect,
  });

  final Category category;
  final Function() onCategorySelect;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCategorySelect,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Column(
          children: [
            Icon(
              category.icon,
              size: 50,
              color: Colors.white,
            ),
            Text(
              category.title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(),
            )
          ],
        ),
      ),
    );
  }
}
