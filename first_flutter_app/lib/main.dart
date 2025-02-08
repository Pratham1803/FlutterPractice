import 'package:flutter/material.dart';
// import 'package:first_flutter_app/gradient_container.dart';
import 'package:first_flutter_app/api/api_get.dart';

void main() {
  // basic example of Background color
  // runApp(
  //   const MaterialApp(
  //     home: Scaffold(
  //       backgroundColor: Colors.lightBlue,
  //       body: Center(
  //         child: Text('Hello World'),
  //       ),
  //     ),
  //   ),
  // );

  // Set Gradient backgrond and text style Example
  // runApp(
  //   MaterialApp(
  //     home: Scaffold(
  //       body: Container(
  //         decoration: const BoxDecoration(
  //           gradient: LinearGradient(
  //             colors: [
  //               Colors.blue,
  //               Colors.green,
  //               Colors.yellow,
  //             ],
  //             begin: Alignment.topLeft,
  //             end: Alignment.bottomRight,
  //           ),
  //         ),
  //         child: const Center(
  //           child: Text(
  //             'Hello World',
  //             style: TextStyle(
  //               color: Colors.white,
  //               fontSize: 36,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   ),
  // );

  // Custom Widget Example
  // runApp(
  //   const MaterialApp(
  //     home: Scaffold(
  //       body: GradientContainer(
  //         [Colors.black, Colors.purple],
  //       ),
  //     ),
  //   ),
  // );

  runApp(
    const MaterialApp(
      home: ApiApp(),
    ),
  );
}
