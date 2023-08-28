import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key, required this.title});

  final String title;

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  ////////////////////////////////////////////
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
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Hint Text',
                    constraints: BoxConstraints(
                      maxWidth: 100,
                    ),
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Hint Text',
                    constraints: BoxConstraints(
                      maxWidth: 100,
                    ),
                  ),
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
