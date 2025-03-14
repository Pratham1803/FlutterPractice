import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_list/data/categories.dart';
import 'dart:convert';
import 'package:shopping_list/models/grocery_item.dart';

class DbItem {
  final firebaseUrl =
      "flutterdemo-d2ced-default-rtdb.asia-southeast1.firebasedatabase.app";
  final path = "shopping-list";
  final localUrl = "10.0.2.2:8000"; // localhost:8000

  Future<List<GroceryItem>> get dbGetAllItemsFirebase async {
    try {
      final List<GroceryItem> lsItems = [];

      final url = Uri.https(firebaseUrl, '$path.json');
      final response = await http.get(url);

      if (response.body == 'null') {
        return [];
      }

      Map<String, dynamic> data = json.decode(response.body);
      debugPrint("data: $data");

      for (final item in data.entries) {
        final category = categories.entries
            .firstWhere(
                (catItem) => catItem.value.title == item.value['category'])
            .value;
        final newItem = GroceryItem(
          id: item.key,
          name: item.value['name'],
          quantity: item.value['quantity'],
          category: category,
        );
        lsItems.add(newItem);
      }
      return lsItems;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Future<List<GroceryItem>> get dbGetAllItemsLocal async {
    try {
      final List<GroceryItem> lsItems = [];

      final url = Uri.http(localUrl, path);
      final response = await http.get(url);
      debugPrint(response.body);

      if (response.body == 'null') {
        return [];
      }

      final jsonRes = json.decode(response.body);
      final List<dynamic> data = jsonRes['data'];
      debugPrint("data: $data");

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
        lsItems.add(newItem);
      }
      return lsItems;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> dbDeleteItemFirebase(id) async {
    try {
      final url = Uri.https(firebaseUrl, '$path/$id.json');
      final res = await http.delete(url);
      debugPrint("Record Deleted:  ${res.body}");

      if (res.statusCode >= 400) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> dbDeleteItemLocal(id) async {
    try {
      final url = Uri.http(localUrl, '$path/$id');
      final res = await http.delete(url);
      debugPrint("Record Deleted:  ${res.body}");

      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String> dbAddItemFirebase(GroceryItem newGroceryItem) async {
    try {
      final url = Uri.https(firebaseUrl, "$path.json");

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          "name": newGroceryItem.name,
          "quantity": newGroceryItem.quantity,
          "category": newGroceryItem.category.title,
        }),
      );
      debugPrint("on Item Insert Res: ${response.body}");
      final Map<String, dynamic> jsonData = json.decode(response.body);
      return jsonData['name'];
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String> dbAddItemLocal(GroceryItem newGroceryItem) async {
    try {
      final url = Uri.http(localUrl, path);

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          "name": newGroceryItem.name,
          "quantity": newGroceryItem.quantity,
          "category": newGroceryItem.category.title,
        }),
      );
      debugPrint("on Item Insert Res: ${response.body}");
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final data = jsonData['data'];
      return data['_id'];
    } catch (e) {
      throw Exception(e);
    }
  }
}
