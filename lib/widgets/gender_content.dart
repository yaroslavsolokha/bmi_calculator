import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GenderContent extends StatelessWidget {
  const GenderContent({super.key, required this.gender});
  final Gender gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          gender == Gender.male
              ? FontAwesomeIcons.mars
              : FontAwesomeIcons.venus,
          size: 60,
        ),
        const SizedBox(height: 10),
        Text(
          gender.name.toString().toUpperCase(),
          style: kLabelText,
        )
      ],
    );
  }
}
