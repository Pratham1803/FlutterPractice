import 'package:flutter/material.dart';
import 'package:first_flutter_app/dice_roller.dart';

const startAlign = Alignment.topLeft;
const endAlign = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.colors, {super.key});

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    // return Text
    // return Container(
    //   decoration: BoxDecoration(
    //     gradient: LinearGradient(
    //       colors: colors,
    //       begin: startAlign,
    //       end: endAlign,
    //     ),
    //   ),
    //   child: const Center(
    //     child: StyledText("Hello, world"),
    //   ),
    // );

    // retrun image
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: startAlign,
          end: endAlign,
        ),
      ),
      child: Center(
        child: DiceRoller(),
      ),
    );
  }
}
