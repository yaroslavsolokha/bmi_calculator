import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/widgets/button.dart';
import 'package:bmi_calculator/widgets/button_container.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.status,
    required this.bmi,
    required this.description,
  });

  final String status;
  final double bmi;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Center(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(8, 16, 8, 8),
                child: Center(
                  child: Text(
                    'Your result',
                    style: kLabelText,
                  ),
                ),
              ),
              Expanded(
                child: ButtonContainer(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        status,
                        style: const TextStyle(
                          fontSize: 40,
                          color: Color.fromARGB(255, 2, 63, 4),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        bmi.toStringAsFixed(1).toString(),
                        style: const TextStyle(fontSize: 100),
                      ),
                      Text(
                        description,
                        style: const TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
              Button(
                text: 'RE-CALCULATE',
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
