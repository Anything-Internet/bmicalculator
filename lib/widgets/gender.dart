import 'package:flutter/material.dart';

 enum Genders {unknown, male, female}

class Gender extends StatelessWidget {
  late final Genders genderChoice;

  Gender({
    super.key,
    required this.genderChoice,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          genderChoice == Genders.female ? Icons.female : Icons.male,
          size: 100,
          color: Colors.white,
        ),
        Text(
          genderChoice == Genders.female ? "Female": "Male",
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}