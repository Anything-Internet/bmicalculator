import 'package:flutter/material.dart';
class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int index) {
        print("BottomNavBar: $index");
        if (index == 0) {
          Navigator.pushNamed(context, '/input_page');
        }
      },
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
  }
}