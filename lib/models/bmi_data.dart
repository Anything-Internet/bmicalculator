import 'dart:math';
import '../widgets/gender.dart';

class BmiData {
  double _pounds = 0;
  double _inches = 0;
  double _age = 0;
  Genders _gender = Genders.unknown;

  List underweight = [0.0, 18.5];
  List healthy = [18.5, 24.9];
  List overweight = [25.0, 29.9];
  List obese = [30.0, 100.0];


  Map normalRange = {
    Genders.male: "Male: 18.5 - 25",
    Genders.female: "Female: 18.5 - 25",
    Genders.unknown: "18.5 - 25",
  };

  Map statusMessage = {
    "Underweight": "You are underweight. You should see a doctor.",
    "Healthy": "You are healthy. Keep up the good work.",
    "Overweight": "You are overweight. You should see a doctor.",
    "Obese": "You are obese. You should see a doctor.",
    "Unknown": "Unable to determine your BMI.",
  };

  get pounds {
    return _pounds.round();
  }

  get kilos {
    return _pounds * 0.45;
  }

  get inches {
    return _inches;
  }

  get age {
    return _age;
  }

  get cms {
    return _inches * 2.54;
  }

  get gender {
    return _gender;
  }

  set inches(value) {
    _inches = value;
  }

  set pounds(value) {
    _pounds = value;
  }

  set gender(value) {
    _gender = value;
  }

  set age(value) {
    _age = value;
  }

  // kilos / sqroot of meters
  get bmi {
    return ((pounds / pow(inches, 2)) * 703).round();
  }

  get bmiScale {
    if (bmi > underweight[0] && bmi < underweight[1]) {
      return "Underweight";
    }
    else if (bmi > healthy[0] && bmi < healthy[1]) {
      return "Healthy";
    }
    else if (bmi > overweight[0] && bmi < overweight[1]) {
      return "Overweight";
    }
    else if (bmi > obese[0] && bmi < obese[1]) {
      return "Obese";
    }
    return "Unknown";
  }

  set kilos(value) {
    _pounds = value * 2.2;
  }

  set cms(value) {
    _inches = value * 0.39;
  }

  BmiData({double pounds = 0, double inches = 0}) {
    _pounds = pounds;
    _inches = inches;
  }
}
