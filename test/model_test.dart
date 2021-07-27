import 'package:flutter_test/flutter_test.dart';
import 'package:liquid_simulation/temperature_model.dart';

void main() {
  test('initial value is 19', () {
    final model = TemperatureModel();
    expect(model.temperature, 19);
  });

  test('TODO add more tests', () {
    // TODO
    fail('not enough tests added');
  });
}
