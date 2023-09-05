import 'package:flutter/material.dart';

Widget themeDemo(context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Theme Demo - Dispay assorted widget for testing themes."),
    ),
    body: Center(
      child: Column(
        children: [
          Text('Standard Text'),
          Divider(),
          Text(
            'bodyMedium',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Hint Text',
            ),
          ),
          ElevatedButton(
              onPressed: (){},
              child: Text('Elevated Button')),
          TextButton(
              onPressed: (){},
              child: Text('Text Button')),
          OutlinedButton(
              onPressed: (){},
              child: Text('Outlined Button')),
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.add)),
          FloatingActionButton(
              onPressed: (){},
              child: Icon(Icons.add)),
          BottomNavigationBar(
            items: [
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
          ),
        ],
      ),
    ),
  );
}
