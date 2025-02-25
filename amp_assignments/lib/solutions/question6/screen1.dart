import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Image(
              image: AssetImage('assets/virat1.jpg'),
              fit: BoxFit.cover,
              height: 150,
              width: 150,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Image(
              image: AssetImage('assets/virat2.jpg'),
              fit: BoxFit.cover,
              height: 150,
              width: 150,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Image(
              image: AssetImage('assets/virat3.jpg'),
              fit: BoxFit.cover,
              height: 150,
              width: 150,
            ),
          ),
        ],
      ),
    ));
  }
}
