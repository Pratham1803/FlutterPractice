// Importing Flutter's material design package for UI components.
import 'package:flutter/material.dart';

// Defining a Category model class.
class Category {
  // Constructor with required and optional parameters.
  const Category({
    required this.id, // Unique identifier for the category.
    required this.title, // Title or name of the category.
    this.icon = Icons.category, // Default icon if none is provided.
    this.color = Colors.blue, // Default color if none is provided.
  });

  final String id; // Stores a unique ID for the category.
  final String title; // Stores the name/title of the category.
  final IconData icon; // Stores the icon associated with the category.
  final Color color; // Stores the color associated with the category.
}
