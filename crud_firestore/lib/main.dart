import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {
  runApp(
    const MaterialApp(
      home: MyAppp(),
    ),
  );
}

class MyAppp extends StatefulWidget {
  const MyAppp({super.key});

  @override
  State<MyAppp> createState() => _MyApppState();
}

class _MyApppState extends State<MyAppp> {
  
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
