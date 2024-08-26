import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/widgets/button_container.dart';
import 'package:bmi_calculator/widgets/gender_content.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            const Expanded(
                child: ButtonContainer(
              child: Text('todo', style: kLabelText),
            )),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ButtonContainer(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('WEIGHT', style: kLabelText),
                          Text(
                            '$weight kg',
                            style: kLabelText.copyWith(fontSize: 40),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: const Icon(FontAwesomeIcons.minus),
                                iconSize: 30.0, // You can adjust the size here
                                onPressed: () {
                                  _changeWeight(Adjustment.decrease);
                                },
                                color: Colors.white, // Change color as needed
                              ),
                              IconButton(
                                icon: const Icon(FontAwesomeIcons.plus),
                                iconSize: 30.0, // You can adjust the size here
                                onPressed: () {
                                  _changeWeight(Adjustment.increase);
                                },
                                color: Colors.white, // Change color as needed
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const Expanded(
                      child: ButtonContainer(
                    child: Text('todo', style: kLabelText),
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
