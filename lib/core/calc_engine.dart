class CalculatorEngine {
  num _first = 0;
  num _second = 0;
  String _operator = "";

  num calculate(num a, num b, String operator) {
    switch (operator) {
      case "+":
        return a + b;
      case "-":
        return a - b;
      case "*":
        return a * b;
      case "/":
        return a / b;
      default:
        return 0;
    }
  }

  void setFirst(num first) {
    _first = first;
  }

  void setSecond(num second) {
    _second = second;
  }

  void setOperator(String operator) {
    _operator = operator;
  }

  num getResult() {
    return calculate(_first, _second, _operator);
  }
}
