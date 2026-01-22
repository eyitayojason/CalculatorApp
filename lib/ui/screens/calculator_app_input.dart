import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/screens/widgets/calc_display.dart';
import 'package:flutter_application_1/ui/screens/widgets/calulator_buttons.dart';
import 'package:flutter_application_1/ui/viewmodels/calculator_vm.dart';
import 'package:provider/provider.dart';

class MyCalculatorApp extends StatelessWidget {
  const MyCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CalculatorVm>();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            CalcDisplay(display: viewModel.display),
            Spacer(),
            _buildButtonRow(context, ['7', '8', '9', '+']),
            _buildButtonRow(context, ['4', '5', '6', '-']),
            _buildButtonRow(context, ['1', '2', '3', '*']),
            _buildButtonRow(context, ['0', 'C', '=', '/']),
          ],
        ),
      ),
    );
  }
}

Widget _buildButtonRow(BuildContext context, List<String> buttons) {
  final viewModel = context.watch<CalculatorVm>();
  return Row(
    children: buttons
        .map(
          (button) => CalculatorButton(
            label: button,
            onPressed: () {
              if (button == 'C') {
                viewModel.clearInput();
              } else if (button == '=') {
                viewModel.calculate();
              } else if (_isOperator(button)) {
                viewModel.inputOperator(button);
              } else {
                viewModel.inputDigit(button);
              }
            },
            color: _isOperator(button) ? Colors.orange : Colors.grey,
            textColor: Colors.black,
          ),
        )
        .toList(),
  );
}

bool _isOperator(String button) {
  return button == '+' || button == '-' || button == '*' || button == '/';
}
