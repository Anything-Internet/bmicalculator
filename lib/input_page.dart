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

  BmiData bmiData = BmiData();

  setBmiData(String field, double value) {
    print("form: $field $value");
    setState(() {
      if (field == 'inches') {
        bmiData.inches = value;
      }
      if (field == 'pounds') {
        bmiData.pounds = value;
      }
      if (bmiData.inches > 0 && bmiData.pounds > 0) {
        print("${bmiData.bmi}: ${bmiData.bmiScale}");
      }
    });
  }

  setTheme() {
    setState(() {
      theme.toggleTheme();
      isDarkMode = theme.currentTheme == "dark" ? true : false;
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
      floatingActionButton: floatingActionButton(),
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

  ////////////////////////////////////////////
  body() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Input the required information',
                style: TextStyle(fontSize: 20)),
            const Divider(),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Height',
                    constraints: BoxConstraints(
                      maxWidth: 100,
                    ),
                  ),
                  onChanged: (String? value) {
                    setBmiData("inches", double.parse(value!));
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Weight',
                    constraints: BoxConstraints(
                      maxWidth: 100,
                    ),
                  ),
                  onChanged: (String? value) {
                    setBmiData("pounds", double.parse(value!));
                  },
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Calculate'),
                ),
              ],
            ),
          ],
        ),
      );
}
