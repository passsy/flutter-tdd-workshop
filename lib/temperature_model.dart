import 'package:flutter/material.dart';

class TemperatureModel extends ChangeNotifier {
  double _temperature = 19;

  double get temperature => _temperature;

  set temperature(double value) {
    _temperature = value;
    notifyListeners();
  }

  /// Increases the [temperature] by 5º
  void increment() {
    // TODO 1. write test
    // TODO 2. implement
    // TODO 3. commit
    notifyListeners();
  }

  /// Decreases the [temperature] by 5º
  void decrement() {
    // TODO 1. write test
    // TODO 2. implement
    // TODO 3. commit
    notifyListeners();
  }
}
