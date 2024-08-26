import 'package:bmi_calculator/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemContent extends StatelessWidget {
  const ItemContent({
    super.key,
    required this.number,
    required this.label,
    required this.measureLabel,
    required this.onPressed,
  });

  final int number;
  final String label;
  final String measureLabel;
  final void Function(Adjustment adjustment) onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label, style: kLabelText),
        Text(
          '$number$measureLabel',
          style: kLabelText.copyWith(fontSize: 40),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(FontAwesomeIcons.minus),
              iconSize: 30.0, // You can adjust the size here
              onPressed: () {
                onPressed(Adjustment.decrease);
              },
              color: Colors.white, // Change color as needed
            ),
            IconButton(
              icon: const Icon(FontAwesomeIcons.plus),
              iconSize: 30.0, // You can adjust the size here
              onPressed: () {
                onPressed(Adjustment.increase);
              },
              color: Colors.white, // Change color as needed
            )
          ],
        )
      ],
    );
  }
}
