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
    final bmiData = ModalRoute.of(context)!.settings.arguments as BmiData;

    return Scaffold(
      appBar: appBar("BMI Calculator"),
      body: body(bmiData),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  body(bmiData) {
    return ReusableCard(
      //color: Colors.red.shade900,
      position: "wide",
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("BMI: ${bmiData.bmi > 0 ? bmiData.bmi : 0}",
                  style: const TextStyle(fontSize: 40)),
              Text(
                "Category: ${bmiData.bmiScale ?? "unknown"}",
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
