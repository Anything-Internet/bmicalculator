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
        print("bmiDataList: ${element.pounds} ${element.inches} = ${element.bmi}");
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
    print("form: $field $value");
    print("bmiData: ${bmiData.pounds} ${bmiData.inches} = ${bmiData.bmi}");
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
        actions: [
          Switch(
            value: isDarkMode,
            onChanged: (value) {
              isDarkMode = value;
              setTheme();
            },
          ),
        ],
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

  body() => Flex(
        direction: Axis.vertical,
        children: [
          Row(
            children: [
              expandedBox(
                child: bmiForm(),
              ),
              expandedBox(child: Text("Two")),
            ],
          ),
          expandedBox(child: Text("Three")),
          Row(
            children: [
              expandedBox(child: Text("Four")),
              expandedBox(child: Text("Five")),
            ],
          ),
        ],
      );

  bmiForm() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 60,
              alignment: Alignment.centerRight,
              child: Text("Height: "),
            ),
            Container(
              width: 70,
              //height: 120,
              child: TextFormField(
                controller: _heightController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "inches",
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                ],
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setBmiData("height", value);
                  value = '';
                },
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: 60,
              alignment: Alignment.centerRight,
              child: Text("Weight: "),
            ),
            Container(
              width: 70,
              //height: 120,
              child: TextFormField(
                controller: _weightController,
                style: TextStyle(color: Colors.white),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                ],
                decoration: InputDecoration(
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
            onPressed: () {
              saveButtonEnabled() ? saveBmiData() : null;},
            child: Text("Save"))
      ],
    );
  }
}

class expandedBox extends StatelessWidget {
  expandedBox({
    Key? key,
    required this.child,
  }) : super(key: key);
  Widget child;
  Color cardColor = Colors.grey.shade900;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        height: 200,
        child: child,
      ),
    );
  }
}
