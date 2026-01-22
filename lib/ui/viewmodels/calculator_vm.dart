import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/calc_engine.dart';

class CalculatorVm extends ChangeNotifier {
  final CalculatorEngine _calculatorEngine = CalculatorEngine();

  String _display = "0";
  num _currentValue = 0;
  String _operator = "";
  bool _isNewEntry = true;

  String get display => _display;

  void inputDigit(String digit) {
    if (_isNewEntry) {
      _display = digit;
      _isNewEntry = false;
    } else {
      _display += digit;
    }
    notifyListeners();
  }

  void inputOperator(String operator) {
    if (_operator.isNotEmpty && !_isNewEntry) {
      _currentValue = _calculatorEngine.calculate(
        _currentValue,
        num.parse(_display),
        _operator,
      );
      _display = _currentValue.toString();
    } else {
      _currentValue = num.parse(_display);
    }
    _operator = operator;
    _isNewEntry = true;
    notifyListeners();
  }

  void calculate() {
    if (_operator.isEmpty) return;

    _currentValue = _calculatorEngine.calculate(
      _currentValue,
      num.parse(_display),
      _operator,
    );
    _display = _currentValue.toString();
    _operator = "";
    _isNewEntry = true;
    notifyListeners();
  }

  void clearInput() {
    _display = "0";
    _currentValue = 0;
    _operator = "";
    _isNewEntry = true;
    notifyListeners();
  }
}
