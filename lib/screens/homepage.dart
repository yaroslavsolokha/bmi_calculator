import 'package:bmi_calculator/widgets/button_container.dart';
import 'package:flutter/material.dart';

const Color defaultContainerColor = Colors.amber;

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  Color defaultContainerColorClicked = Colors.amber[200]!;

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
            const Expanded(
              child: Row(
                children: [
                  ButtonContainer(
                    color: defaultContainerColor,
                  ),
                  ButtonContainer(
                    color: defaultContainerColor,
                  ),
                ],
              ),
            ),
            ButtonContainer(
              color: defaultContainerColorClicked,
            ),
            Expanded(
              child: Row(
                children: [
                  ButtonContainer(
                    color: defaultContainerColorClicked,
                  ),
                  ButtonContainer(
                    color: defaultContainerColorClicked,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
