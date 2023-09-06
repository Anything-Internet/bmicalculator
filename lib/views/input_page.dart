import 'package:bmicalculator/models/bmi_data.dart';
import 'package:bmicalculator/widgets/gender.dart';
import 'package:bmicalculator/widgets/round_icon_button.dart';
import 'package:bmicalculator/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/app_bar.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/reusable_card.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  ////////////////////////////////////////////

  String inputWeight = "";
  String inputHeight = "";
  bool isMetric = true;

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
      if (field == 'age') {
        bmiData.age = value.round();
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
      appBar: appBar("BMI Calculator"),
      body: body(),
      //bottomNavigationBar: const BottomNavBar(),
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
      ReusableCard(
        color: myRed,
        position: "wide",
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                isMetric ? "Metric":
                "Imperial",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Switch(
                trackColor: MaterialStateColor.resolveWith(
                    (states) => myDarkBlue.withOpacity(0.45)),
                thumbColor: MaterialStateColor.resolveWith(
                        (states) => myDarkBlue.withOpacity(0.0)),

                  value: isMetric,
                  onChanged: (value){setState(() {
                    isMetric = value;
                  });}
              ),
            ],
          ),
        ),
        callback: () {
          if (bmiData.bmi > 0 && bmiData.bmi < double.infinity) {
            Navigator.pushNamed(
              context,
              '/results_page',
              arguments: bmiData,
            );
          }
        },
      ),

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
                setBmiData(
                    "gender",
                    bmiData.gender == Genders.male
                        ? Genders.unknown
                        : Genders.male);
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
                setBmiData(
                    "gender",
                    bmiData.gender == Genders.female
                        ? Genders.unknown
                        : Genders.female);
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
                  isMetric ? Text(bmiData.cms.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 40))
                      : Text(bmiData.inches.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 40)),
                   Text(
                   isMetric ? " cms":" inches",
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
                    (states) => myRed.withOpacity(0.0)),
                onChanged: (value) {
                  setBmiData('height', value);
                },
              ),
            ],
          ),
        ),
      ),
      Expanded(
        child: Row(
          children: [
            Expanded(
              child: ReusableCard(
                position: "left",
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text("Weight", style: TextStyle(fontSize: 20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Text(
                            isMetric ? bmiData.kilos.toString():
                            bmiData.pounds.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 40)),
                        Text(
                          isMetric ? " kgs":" pounds",
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RoundIconButton(
                          //borderColor: myGrey,
                          onPressed: () {
                            setBmiData('weight', bmiData.pounds - 5);
                          },
                          tooltip: '',
                          child: const Icon(Icons.remove, color: Colors.white),
                        ),
                        RoundIconButton(
                          //borderColor: myGrey,
                          onPressed: () {
                            setBmiData('weight', bmiData.pounds + 5);
                          },
                          tooltip: '',
                          child: const Icon(Icons.add, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ReusableCard(
                position: "right",
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text("Age", style: TextStyle(fontSize: 20)),
                    Text(bmiData.age.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 40)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RoundIconButton(
                          //borderColor: myGrey,
                          onPressed: () {
                            setBmiData('age', bmiData.age - 1);
                          },
                          tooltip: '',
                          child: const Icon(Icons.remove, color: Colors.white),
                        ),
                        RoundIconButton(
                          //borderColor: myGrey,
                          onPressed: () {
                            setBmiData('age', bmiData.age + 1);
                          },
                          tooltip: '',
                          child: const Icon(Icons.add, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
        child: ReusableCard(
          color: myRed,
          position: "wide",
          child: const Center(
            child: Text(
              "Calculate BMI",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          callback: () {
            if (bmiData.bmi > 0 && bmiData.bmi < double.infinity) {
              Navigator.pushNamed(
                context,
                '/results_page',
                arguments: bmiData,
              );
            }
          },
        ),
      ),
    ]);
  }
}
