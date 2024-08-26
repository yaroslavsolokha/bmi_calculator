import 'dart:math';

class Calculation {
  const Calculation({
    required this.height,
    required this.weight,
  });

  final int height;
  final int weight;

  double getBMI() {
    return weight / pow((height / 100), 2);
  }
}
