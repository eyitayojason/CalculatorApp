import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/ui/viewmodels/calculator_vm.dart';

void main() {
  group('CalculatorVm', () {
    late CalculatorVm vm;

    setUp(() {
      vm = CalculatorVm();
    });

    test('initial state is correct', () {
      expect(vm.display, '0');
    });

    test('inputDigit updates display correctly', () {
      vm.inputDigit('1');
      expect(vm.display, '1');
      vm.inputDigit('2');
      expect(vm.display, '12');
    });

    test('inputDigit handles multiple digits', () {
      vm.inputDigit('1');
      vm.inputDigit('2');
      vm.inputDigit('3');
      expect(vm.display, '123');
    });

    test('simple addition works', () {
      vm.inputDigit('2');
      vm.inputOperator('+');
      vm.inputDigit('3');
      vm.calculate();
      expect(vm.display, '5');
    });

    test('simple subtraction works', () {
      vm.inputDigit('5');
      vm.inputOperator('-');
      vm.inputDigit('2');
      vm.calculate();
      expect(vm.display, '3');
    });

    test('simple multiplication works', () {
      vm.inputDigit('3');
      vm.inputOperator('*');
      vm.inputDigit('4');
      vm.calculate();
      expect(vm.display, '12');
    });

    test('simple division works', () {
      vm.inputDigit('8');
      vm.inputOperator('/');
      vm.inputDigit('2');
      vm.calculate();
      expect(vm.display, '4.0'); // division results in double
    });

    test('chained operations work', () {
      // 2 + 3 * 4 = 20 (sequential execution as per current logic, not BEDMAS)
      // Logic: (2 + 3) = 5 -> 5 * 4 = 20
      vm.inputDigit('2');
      vm.inputOperator('+');
      vm.inputDigit('3');

      // Pressing '*' should calculate 2+3 first
      vm.inputOperator('*');
      expect(vm.display, '5'); // Intermediate result

      vm.inputDigit('4');
      vm.calculate();
      expect(vm.display, '20');
    });

    test('clearInput resets state', () {
      vm.inputDigit('5');
      vm.inputOperator('+');
      vm.clearInput();
      expect(vm.display, '0');

      // Verify starting fresh works
      vm.inputDigit('2');
      expect(vm.display, '2');
    });

    test('calculate without operator does nothing', () {
      vm.inputDigit('5');
      vm.calculate();
      expect(vm.display, '5');
    });

    test('change operator', () {
      vm.inputDigit('5');
      vm.inputOperator('+');
      // User changes mind
      vm.inputOperator('*');
      vm.inputDigit('2');
      vm.calculate();
      expect(vm.display, '10');
    });
  });
}
