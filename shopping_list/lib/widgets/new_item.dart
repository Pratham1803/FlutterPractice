import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/category.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_list/models/grocery_item.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();
  var _enteredName = "";
  var _enteredQuantity = 1;
  var _selectedCategory = categories[Categories.vegetables];
  bool _isAdding = false;

  void _saveItem() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      setState(() {
        _isAdding = true;
      });

      // firebase url
      // final url = Uri.https(
      //     'flutterdemo-d2ced-default-rtdb.asia-southeast1.firebasedatabase.app',
      //     'shopping-list.json');

      // local host url
      final url = Uri.http('localhost:8000', '/shopping-list'); 

      final response = await http
          .post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          "name": _enteredName,
          "quantity": _enteredQuantity,
          "category": _selectedCategory!.title,
        }),
      );

      if (!context.mounted) {
        return;
      }

      setState(() {
        _isAdding = false;
      });

      debugPrint(response.body); 

      final Map<String, dynamic> jsonData = json.decode(response.body);

      final newItem = GroceryItem(
          id: jsonData['id'],
          name: _enteredName,
          category: _selectedCategory!,
          quantity: _enteredQuantity);

      Navigator.of(context).pop(newItem);
      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a New Item"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text("Name"),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.length > 50) {
                    return 'Must be Between 1 and 50 characters';
                  }
                  return null;
                },
                onSaved: (value) {
                  _enteredName = value!;
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Quantity'),
                      ),
                      initialValue: '1',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null ||
                            int.tryParse(value)! <= 0) {
                          return 'Must be Valid Positive Number';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        _enteredQuantity = int.parse(newValue!);
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: _selectedCategory,
                      items: [
                        for (final category in categories.entries)
                          DropdownMenuItem(
                            value: category.value,
                            child: Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    color: category.value.color,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  category.value.title,
                                )
                              ],
                            ),
                          )
                      ],
                      onChanged: (value) {
                        _selectedCategory = value!;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _isAdding
                        ? null
                        : () {
                            _formKey.currentState!.reset();
                          },
                    child: const Text('Reset'),
                  ),
                  ElevatedButton(
                    onPressed: _isAdding ? null : _saveItem,
                    child: _isAdding
                        ? const SizedBox(
                            height: 16,
                            width: 16,
                            child: CircularProgressIndicator(),
                          )
                        : const Text("Add Item"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
