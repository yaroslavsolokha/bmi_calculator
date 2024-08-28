import 'dart:math';

class Calculation {
  final int height;
  final int weight;
  late final double _bmi;

  Calculation({
    required this.height,
    required this.weight,
  }) {
    _bmi = _calculateBMI();
  }

  double getBMI() {
    return _bmi;
  }

  double _calculateBMI() {
    return weight / pow((height / 100), 2);
  }

  Map<String, String> getInfo() {
    String status;
    String description;

    if (_bmi >= 25) {
      status = 'Overweight';
      description = 'You should go to a gym. Go!';
    } else if (_bmi > 18.5) {
      status = 'Normal';
      description = 'You have a very good physical conditions.';
    } else {
      status = 'Underweight';
      description = 'You should start your day with eating Big mac menu.';
    }

    return {
      'status': status,
      'description': description,
    };
  }
}
