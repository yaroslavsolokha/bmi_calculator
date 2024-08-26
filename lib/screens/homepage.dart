import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/widgets/button_container.dart';
import 'package:bmi_calculator/widgets/gender_content.dart';
import 'package:bmi_calculator/widgets/item_content.dart';
import 'package:flutter/material.dart';

enum Gender { male, female }

enum Adjustment { increase, decrease }

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  Gender? genderClicked;
  int weight = 80;
  int age = 30;
  int height = 180;

  void _onGenderTap(Gender gender) {
    setState(() {
      genderClicked = gender;
    });
  }

  void _changeWeight(Adjustment adjustment) {
    setState(() {
      if (adjustment == Adjustment.increase) {
        weight++;
      }

      if (adjustment == Adjustment.decrease) {
        weight--;
      }
    });
  }

  void _changeAge(Adjustment adjustment) {
    setState(() {
      if (adjustment == Adjustment.increase) {
        age++;
      }

      if (adjustment == Adjustment.decrease) {
        age--;
      }
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
            Expanded(
              child: ButtonContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: kLabelText,
                    ),
                    Text(
                      '$height cm',
                      style: kLabelText,
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 210,
                      activeColor: Colors.white,
                      thumbColor: kUnclickedContainerColor,
                      onChanged: (value) {
                        setState(() {
                          height = value.toInt();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ButtonContainer(
                      child: ItemContent(
                        number: weight,
                        label: 'WEIGHT',
                        measureLabel: ' kg',
                        onPressed: _changeWeight,
                      ),
                    ),
                  ),
                  Expanded(
                      child: ButtonContainer(
                    child: ItemContent(
                      number: age,
                      label: 'AGE',
                      measureLabel: '',
                      onPressed: _changeAge,
                    ),
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: kUnclickedContainerColor,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(20), // Set the radius here
                  ),
                ),
                child: const Text(
                  'CALCULATE',
                  style: kLabelText,
                ),
              ),
            ),
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
          Expanded(
            child: ButtonContainer(
              color: genderClicked != Gender.male
                  ? kUnclickedContainerColor
                  : null,
              gender: Gender.male,
              onTap: _onGenderTap,
              child: const GenderContent(gender: Gender.male),
            ),
          ),
          Expanded(
            child: ButtonContainer(
              color: genderClicked != Gender.female
                  ? kUnclickedContainerColor
                  : null,
              gender: Gender.female,
              onTap: _onGenderTap,
              child: const GenderContent(gender: Gender.female),
            ),
          ),
        ],
      ),
    );
  }
}
