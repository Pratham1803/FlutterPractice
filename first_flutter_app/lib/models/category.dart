import 'package:flutter/material.dart';

class Category{
  const Category({
    required this.id,
    required this.title,
    this.icon = Icons.category,
    this.color = Colors.blue,
  });


  final String id;
  final String title;
  final IconData icon;
  final Color color;

}