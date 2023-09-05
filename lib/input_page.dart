import 'package:bmicalculator/bmi_data.dart';
import 'package:bmicalculator/gender.dart';
import 'package:bmicalculator/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'bottom_navbar.dart';
import 'reusable_card.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key, required this.title});

  final String title;

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  ////////////////////////////////////////////

  String inputWeight = "";
  String inputHeight = "";

  BmiData bmiData = BmiData();

  saveBmiData() {
    setState(() {
      bmiData = BmiData();
      _heightController.clear();
      _weightController.clear();
    });
  }

  saveButtonEnabled() {
    if (bmiData.pounds > 0 && bmiData.inches > 0) {
      return true;
    }
    return false;
  }

  setBmiData(String field, var value) {
    setState(() {
      if (field == 'height') {
        bmiData.inches = value.round();
      }
      if (field == 'weight') {
        bmiData.pounds = value.round();
      }
      if (field == 'gender') {
        bmiData.gender = value;
      }
    });
  }

  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  void dispose() {
    // other dispose methods
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(widget.title),
      body: body(),
      bottomNavigationBar: const BottomNavBar(),
      //floatingActionButton: floatingActionButton(),
    );
  }

  ////////////////////////////////////////////
  floatingActionButton() => FloatingActionButton(
        onPressed: () {},
        tooltip: '',
        child: const Icon(Icons.monitor_heart),
      );

  body() {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Expanded(
          child: Row(
        children: [
          Expanded(
            child: ReusableCard(
              position: "left",
              color: bmiData.gender == Genders.male
                  ? Colors.blue
                  : const Color(0xFF252536),
              callback: () {
                setBmiData("gender", Genders.male);
              },
              child: Gender(genderChoice: Genders.male),
            ),
          ),
          Expanded(
            child: ReusableCard(
              position: "right",
              color: bmiData.gender == Genders.female
                  ? Colors.pink.shade300
                  : const Color(0xFF252536),
              callback: () {
                setBmiData("gender", Genders.female);
              },
              child: Gender(genderChoice: Genders.female),
            ),
          ),
        ],
      )),
      Expanded(
        child: ReusableCard(
          position: "wide",
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("Height", style: TextStyle(fontSize: 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(bmiData.inches.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 40)),
                  const Text(
                    " inches",
                  ),
                ],
              ),
              Slider(
                value: bmiData.inches,
                min: 0,
                max: 100,
                divisions: 100,
                thumbColor: myRed,
                activeColor: myRed,
                overlayColor: MaterialStateColor.resolveWith(
                    (states) => myRed.withOpacity(0.15)),
                onChanged: (value) {
                  setBmiData('height', value);
                },
              ),
            ],
          ),
        ),
      ),
      const Expanded(
        child: Row(
          children: [
            Expanded(
              child: ReusableCard(
                position: "left",
                child: Placeholder(),
              ),
            ),
            Expanded(
              child: ReusableCard(
                position: "right",
                child: Placeholder(),
              ),
            ),
          ],
        ),
      ),
      ReusableCard(
        color: Colors.red.shade900,
        position: "wide",
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("BMI: ${bmiData.bmi > 0 ? bmiData.bmi : 0}"),
                Text("Category: ${bmiData.bmiScale ?? "unknown"}"),
              ],
            ),
          ],
        ),
        callback: () {
          print("BMI: ${bmiData.bmi}");
        },
      ),
    ]);
  }
}

appBar(title) {
  return AppBar(
    title: Text(title, style: const TextStyle()),
  );
}
