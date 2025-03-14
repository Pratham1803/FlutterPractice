import 'package:shopping_list/models/category.dart';

class GroceryItem {
  GroceryItem({
    this.id = '',
    required this.name,
    required this.quantity,
    required this.category,
  });

  String id;
  final String name;
  final int quantity;
  final Category category;
}
