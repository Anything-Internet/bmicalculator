import 'package:bmicalculator/theme.dart';
import 'package:bmicalculator/theme_demo.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: CustomTheme.dark,
      home: const InputPage(title: 'BMI Calculator'),
    );
  }
}
