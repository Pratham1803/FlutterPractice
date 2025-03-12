// Importing Flutter's material design package for UI components.
import 'package:flutter/material.dart';

// Importing the Category model to use Category objects.
import 'package:first_flutter_app/models/category.dart';

// Creating a constant list of available categories.
const availableCategories = [
  Category(
    id: 'c1', // Unique identifier for this category.
    title: 'Profile', // Category name displayed in the UI.
    icon: Icons.person, // Icon representing the category (Profile).
  ),
  Category(
    id: 'c2',
    title: 'Attendance',
    icon: Icons.how_to_reg, // Icon representing attendance.
  ),
  Category(
    id: 'c3',
    title: 'Fees Status',
    icon: Icons.price_check, // Icon representing fees status.
  ),
  Category(
    id: 'c4',
    title: 'Result',
    icon: Icons.bar_chart, // Icon representing exam results.
  ),
];
