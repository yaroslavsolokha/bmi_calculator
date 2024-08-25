import 'package:bmi_calculator/widgets/button_container.dart';
import 'package:flutter/material.dart';

const Color unclickedContainerColor = Colors.amber;

enum Gender {
  male,
  female,
}

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  Gender? genderClicked;

  void _onGenderTap(Gender gender) {
    setState(() {
      genderClicked = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildGenderSelectionRow(),
            const ButtonContainer(),
            const Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ButtonContainer(),
                  ButtonContainer(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildGenderSelectionRow() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ButtonContainer(
            color:
                genderClicked != Gender.male ? unclickedContainerColor : null,
            gender: Gender.male,
            onTap: _onGenderTap,
          ),
          ButtonContainer(
            color:
                genderClicked != Gender.female ? unclickedContainerColor : null,
            gender: Gender.female,
            onTap: _onGenderTap,
          ),
        ],
      ),
    );
  }
}
