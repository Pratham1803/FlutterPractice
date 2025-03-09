import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() async {
  // runApp(const MyApp());
    debugPrint("Data Fetched Successfully");
  var db = FirebaseFirestore.instance;
  
  await db.collection("users").get().then((event) {
    debugPrint("Data Fetched Successfully");
    for (var doc in event.docs) {
      debugPrint("${doc.id} => ${doc.data()}");
      // print("${doc.id} => ${doc.data()}");
    }
  });
}
