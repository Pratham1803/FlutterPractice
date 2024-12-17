import 'package:flutter/material.dart';
import 'dart:math';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});
  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var diceNumber = 2;

  void onClick() {
    setState(() {
      diceNumber = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/dice-$diceNumber.png',
          width: 300,
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: onClick,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(10),
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 24,
            ),
          ),
          child: const Text("Roll Dice"),
        ),
      ],
    );
  }
}