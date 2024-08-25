import 'package:bmi_calculator/screens/homepage.dart';
import 'package:bmi_calculator/widgets/gender_content.dart';
import 'package:flutter/material.dart';

Color defaultContainerColor = Colors.amber[200]!;

class ButtonContainer extends StatelessWidget {
  const ButtonContainer({
    super.key,
    this.color,
    this.gender,
    this.onTap,
  });

  final Color? color;
  final Gender? gender;
  final void Function(Gender gender)? onTap;

  @override
  Widget build(BuildContext context) {
    if (gender != null) {
      return Expanded(
        child: GestureDetector(
          onTap: () {
            onTap!(gender!);
          },
          child: Container(
            margin: const EdgeInsets.all(15.0),
            color: color ?? defaultContainerColor,
            child: GenderContent(gender: gender!),
          ),
        ),
      );
    } else {
      return Expanded(
        child: Container(
          margin: const EdgeInsets.all(15.0),
          color: color ?? defaultContainerColor,
        ),
      );
    }
  }
}
