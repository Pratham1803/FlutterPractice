import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/new_item.dart';
import 'package:http/http.dart' as http;

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> _groceryItems = [];
  bool _isLoading = true;
  String _errorMsg = '';

  @override
  void initState() {
    _getData();
    super.initState();
  }

  void _getData() async {
    try {
      // firebase url
      // final url = Uri.https(
      //     'flutterdemo-d2ced-default-rtdb.asia-southeast1.firebasedatabase.app',
      //     'shopping-list.json');

      // local host url
      final url = Uri.http('localhost:8000', '/shopping-list');

      final response = await http.get(url);

      if (response.body == 'null') {
        setState(() {
          _isLoading = false;
        });

        return;
      }

      // for firebase
      // Map<String, dynamic> data = json.decode(response.body);

      // for local server
      final jsonRes = json.decode(response.body);
      final List<dynamic> data = jsonRes['data'];

      debugPrint("data: $data");

      final List<GroceryItem> loadedItems = [];
      // for firebase
      // for (final item in data.entries) {
      //   final category = categories.entries
      //       .firstWhere(
      //           (catItem) => catItem.value.title == item.value['category'])
      //       .value;
      //   final newItem = GroceryItem(
      //     id: item.key,
      //     name: item.value['name'],
      //     quantity: item.value['quantity'],
      //     category: category,
      //   );

      // for local server
      for (final item in data) {
        final category = categories.entries
            .firstWhere((catItem) => catItem.value.title == item['category'])
            .value;
        final newItem = GroceryItem(
          id: item['_id'],
          name: item['name'],
          quantity: item['quantity'],
          category: category,
        );
        setState(() {
          _isLoading = false;
        });
        loadedItems.add(newItem);
      }

      setState(() {
        _groceryItems = loadedItems;
      });
    } catch (error) {
      debugPrint("Error: $error");
      setState(() {
        _errorMsg = 'Somthing Went Wrong';
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
    final index = _groceryItems.indexOf(item);
    setState(() {
      _groceryItems.remove(item);
    });

    // firebase
    // final url = Uri.https(
    //     'flutterdemo-d2ced-default-rtdb.asia-southeast1.firebasedatabase.app',
    //     'shopping-list/${item.id}.json');
    
    // local server
    final url = Uri.http(
        'localhost:8000',
        'shopping-list/${item.id}');

    final res = await http.delete(url);
    debugPrint("Record Deleted:  $res");

    if (res.statusCode >= 400) {
      setState(() {
        _groceryItems.insert(index, item);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Something Went Wrong!!'),
        ),
      );
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
