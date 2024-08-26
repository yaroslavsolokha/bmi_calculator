import 'package:bmi_calculator/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class ButtonContainer extends StatelessWidget {
  const ButtonContainer({
    super.key,
    required this.child,
    this.color,
    this.gender,
    this.onTap,
  });

  final Widget child;
  final Color? color;
  final Gender? gender;
  final void Function(Gender gender)? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null && gender != null) {
          onTap!(gender!);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: color ?? defaultContainerColor,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        margin: const EdgeInsets.all(10.0),
        child: child,
      ),
    );
  }
}
