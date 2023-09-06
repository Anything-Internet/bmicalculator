import 'package:bmicalculator/theme.dart';
import 'package:flutter/material.dart';

import '../models/bmi_data.dart';
import '../widgets/app_bar.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/reusable_card.dart';

class ResultsPage extends StatelessWidget {
  late final BmiData bmiData;

  ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      bmiData = ModalRoute.of(context)!.settings.arguments as BmiData;
    } else {
      // default data for testing
      bmiData = BmiData(
        inches: 72,
        pounds: 250,
      );
    }

    return Scaffold(
      appBar: appBar("BMI Calculator"),
      body: body(context, bmiData),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  body(context, bmiData) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text("Your Results", style: TextStyle(fontSize: 20)),
        ),
        ReusableCard(
          //color: Colors.red.shade900,
          position: "wide",
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(
                  "${bmiData.bmiScale ?? "unknown"}",
                  style: const TextStyle(fontSize: 20, color: Colors.green),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Text("${bmiData.bmi > 0 ? bmiData.bmi : 0}",
                    style: const TextStyle(fontSize: 60, color: Colors.white)),
              ),
              const Text(
                "Normal range of BMI",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              Text(
                bmiData.normalRange[bmiData.gender],
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 40),
                child: Text(
                  bmiData.statusMessage[bmiData.bmiScale],
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: ReusableCard(
            color: myRed,
            position: "wide",
            callback: () {
              Navigator.pushNamed(
                context,
                '/input_page',
                arguments: bmiData,
              );
            },
            child: const Center(
              child: Text(
                "Recalculate BMI",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
