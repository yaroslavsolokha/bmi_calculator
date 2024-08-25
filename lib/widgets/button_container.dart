import 'package:flutter/material.dart';

class ButtonContainer extends StatelessWidget {
  const ButtonContainer({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(15.0),
        color: color,
      ),
    );
  }
}
