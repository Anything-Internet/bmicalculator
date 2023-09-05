import 'package:bmicalculator/theme.dart';
import 'package:bmicalculator/views/results_page.dart';
import 'package:flutter/material.dart';
import 'views/input_page.dart';

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
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      initialRoute: '/input_page',
      routes: {
        '/input_page': (context) => const InputPage(),
        '/results_page': (context) => ResultsPage(),
      }
    );
  }
}
