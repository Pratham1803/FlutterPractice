import 'package:flutter/material.dart';

import 'package:first_flutter_app/models/category.dart';

const availableCategories = [
  Category(
    id: 'c1',
    title: 'Profile',
    icon: Icons.person, // Remove Icon widget, use only IconData
  ),
  Category(
    id: 'c2',
    title: 'Attendance',
    icon: Icons.how_to_reg,
  ),
  Category(
    id: 'c3',
    title: 'Fees Status',
    icon: Icons.price_check,
  ),
  Category(
    id: 'c4',
    title: 'Result',
    icon: Icons.bar_chart,
  ),
];
