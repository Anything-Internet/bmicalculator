import 'package:bmicalculator/bmi_data.dart';
import 'package:flutter/material.dart';
import 'package:bmicalculator/theme.dart';
import 'package:flutter/services.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key, required this.title});

  final String title;

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  ////////////////////////////////////////////

  bool isDarkMode = theme.currentTheme == "dark" ? true : false;

  String inputWeight = "";
  String inputHeight = "";

  List<BmiData> bmiDataList = [
    BmiData(pounds: 150, inches: 60),
    BmiData(pounds: 200, inches: 72),
    BmiData(pounds: 250, inches: 84),
  ];
  BmiData bmiData = BmiData();

  saveBmiData() {
    setState(() {
      bmiDataList.add(bmiData);
      bmiData = BmiData();
      _heightController.clear();
      _weightController.clear();
      bmiDataList.forEach((element) {
        print(
            "bmiDataList:  ${element.inches} ${element.pounds} = ${element.bmi.toStringAsFixed(2)}");
      });
    });
  }

  saveButtonEnabled() {
    if (bmiData.pounds > 0 && bmiData.inches > 0) {
      return true;
    }
    return false;
  }

  setBmiData(String field, String value) {
    value = value == "" ? "0" : value;
    //print("form: $field $value");
    //print("bmiData: ${bmiData.pounds} ${bmiData.inches} = ${bmiData.bmi}");
    setState(() {
      if (field == 'height') {
        bmiData.inches = double.parse(value);
      }
      if (field == 'weight') {
        bmiData.pounds = double.parse(value);
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

  setTheme() {
    setState(() {
      print("isDarkMode: $isDarkMode");
      theme.toggleTheme();
      isDarkMode = theme.currentTheme == "dark" ? true : false;
      print("isDarkMode: $isDarkMode");

      Theme(data: theme.dark, child: widget);
      // Theme.of(context)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(widget.title),
      body: body(),
      bottomNavigationBar: bottomNavBar(),
      //floatingActionButton: floatingActionButton(),
    );
  }

  ////////////////////////////////////////////
  appBar(title) => AppBar(
        title: Text(title),
        // actions: [
        //   Switch(
        //     value: isDarkMode,
        //     onChanged: (value) {
        //       isDarkMode = value;
        //       setTheme();
        //     },
        //   ),
        // ],
      );

  ////////////////////////////////////////////
  bottomNavBar() => BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
      );

  ////////////////////////////////////////////
  floatingActionButton() => FloatingActionButton(
        onPressed: () {},
        tooltip: '',
        child: const Icon(Icons.monitor_heart),
      );

  body() {
    return Column(children: [
      Expanded(
          child: Row(
        children: [
          Expanded(
            child: ReusableCard(
              child: bmiForm(),
              position: "left",
            ),
          ),
          Expanded(
            child: ReusableCard(
              child: bmiForm(),
              position: "right",
            ),
          ),
        ],
      )),
      Expanded(
        child: ReusableCard(
          color: const Color(0xFF3D3E44),
          child: bmiForm(),
          position: "wide",
        ),
      ),
      Expanded(
          child: Row(
        children: [
          Expanded(
            child: ReusableCard(
              child: bmiForm(),
              position: "left",
            ),
          ),
          Expanded(
            child: ReusableCard(
              child: bmiForm(),
              position: "right",
            ),
          ),
        ],
      )),
    ]);
  }

  bmiForm() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              alignment: Alignment.centerRight,
              child: const Text("Height: "),
            ),
            Container(
              width: 70,
              child: TextFormField(
                controller: _heightController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: "inches",
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                ],
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setBmiData("height", value);
                },
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              alignment: Alignment.centerRight,
              child: const Text("Weight: "),
            ),
            SizedBox(
              width: 70,
              child: TextFormField(
                controller: _weightController,
                style: const TextStyle(color: Colors.white),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                ],
                decoration: const InputDecoration(
                  hintText: "Pounds",
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setBmiData("weight", value);
                },
              ),
            ),
          ],
        ),
        OutlinedButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size(135, 40)),
            ),
            onPressed: () {
              saveButtonEnabled() ? saveBmiData() : null;
            },
            child: const Text("Save"))
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Color defColor = const Color(0xFF2D2E44);
  final String position; // left, right, center, wide - to affect margins
  final Color? color;
  final Widget? child;

  const ReusableCard(
      {super.key, this.color, this.child, this.position = "wide"});

  @override
  Widget build(BuildContext context) {
    const double defMargin = 10;
    const double defHalfMargin = defMargin / 2;
    late EdgeInsetsGeometry? margin;

    if (position == "left") {
      margin = const EdgeInsets.fromLTRB(
          defMargin, defHalfMargin, defHalfMargin, defHalfMargin);
    }
    if (position == "right") {
      margin = const EdgeInsets.fromLTRB(
          defHalfMargin, defHalfMargin, defMargin, defHalfMargin);
    }
    if (position == "center") {
      margin = const EdgeInsets.fromLTRB(
          defHalfMargin, defHalfMargin, defHalfMargin, defHalfMargin);
    }
    if (position == "wide") {
      margin = const EdgeInsets.fromLTRB(
          defMargin, defHalfMargin, defMargin, defHalfMargin);
    }

    return Container(
      margin: margin,
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: color ?? defColor,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.grey.shade800,
          width: 2,
        ),
      ),
      child: child ?? const Text("Empty Box"),
    );
  }
}
