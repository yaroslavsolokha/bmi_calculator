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
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onTap!(gender!);
        },
        child: Container(
          decoration: BoxDecoration(
            color: color ?? defaultContainerColor,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          margin: const EdgeInsets.all(10.0),
          child: gender != null ? GenderContent(gender: gender!) : null,
        ),
      ),
    );
  }
}
