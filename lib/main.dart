import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/screens/calculator_app_input.dart';
import 'package:flutter_application_1/ui/viewmodels/calculator_vm.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // use Material 3 theme
        useMaterial3: true,

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // wrap with ChangeNotifierProvider so that the CalculatorVm is available to the entire app
      home: ChangeNotifierProvider(
        create: (_) => CalculatorVm(),
        child: const MyCalculatorApp(),
      ),
    );
  }
}
