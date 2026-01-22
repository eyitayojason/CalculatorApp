import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/core/calc_engine.dart';

void main() {
  group('CalculatorEngine', () {
    late CalculatorEngine engine;

    setUp(() {
      engine = CalculatorEngine();
    });

    test('calculate returns correct sum', () {
      expect(engine.calculate(2, 3, '+'), 5);
    });

    test('calculate returns correct difference', () {
      expect(engine.calculate(5, 3, '-'), 2);
    });

    test('calculate returns correct product', () {
      expect(engine.calculate(2, 3, '*'), 6);
    });

    test('calculate returns correct quotient', () {
      expect(engine.calculate(6, 3, '/'), 2);
    });

    test('calculate returns 0 for unknown operator', () {
      expect(engine.calculate(2, 3, '%'), 0);
    });

    test('calculate handles division by zero', () {
      expect(engine.calculate(6, 0, '/'), double.infinity);
    });

    test('state is maintained via setters', () {
      engine.setFirst(10);
      engine.setSecond(20);
      engine.setOperator('+');
      expect(engine.getResult(), 30);
    });
  });
}
