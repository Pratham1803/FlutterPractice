import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/new_item.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_list/db/item.db.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> _groceryItems = [];
  bool _isLoading = true;
  String _errorMsg = '';
  final DbItem dbItem = DbItem();

  @override
  void initState() {
    _getData();
    super.initState();
  }

  void _getData() async {
    try {
      _groceryItems = await dbItem.dbGetAllItemsFirebase;
      setState(() {
        _isLoading = false;
        debugPrint("Fetched List: $_groceryItems");
      });
    } catch (e, stackTrace) {
      debugPrint("Error in GetData Message: $e, \nStack Trace: $stackTrace");
      setState(() {
        _errorMsg = "Something Went Wrong!!";
      });
    }
  }

  void _addItem() async {
    final newItem = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const NewItem(),
      ),
    );

    if (newItem != null) {
      setState(() {
        _groceryItems.add(newItem);
      });
    }
  }

  void _removeItem(GroceryItem item) async {
    try {
      final index = _groceryItems.indexOf(item);
      setState(() {
        _groceryItems.remove(item);
      });

      final bool isDeleted = await dbItem.dbDeleteItemFirebase(item.id);

      if (!isDeleted) {
        setState(() {
          _groceryItems.insert(index, item);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Something Went Wrong!!'),
          ),
        );
      }
    } catch (e) {
      debugPrint("Error in Delete Item: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget body = const Center(
      child: Text(
        "No Items Are There to Show!!",
        textAlign: TextAlign.center,
      ),
    );

    if (_groceryItems.isNotEmpty) {
      body = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(_groceryItems[index].id),
            onDismissed: (direction) {
              _removeItem(_groceryItems[index]);
            },
            child: ListTile(
              leading: Container(
                width: 25,
                height: 25,
                decoration:
                    BoxDecoration(color: _groceryItems[index].category.color),
              ),
              title: Text(_groceryItems[index].name),
              trailing: Text(_groceryItems[index].quantity.toString()),
            ),
          );
        },
      );
    }

    if (_isLoading) {
      body = const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_errorMsg.isNotEmpty) {
      body = Center(
        child: Text(
          _errorMsg,
          textAlign: TextAlign.center,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: body,
    );
  }
}
