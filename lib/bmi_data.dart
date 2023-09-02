import 'dart:math';

class BmiData {

  double _pounds = 0;
  double _inches = 0;

  List underweight = [0.0, 18.5];
  List healthy = [18.5, 24.9];
  List overweight =  [25.0, 29.9];
  List obese = [30.0, 100.0];

  get pounds { return _pounds; }
  get kilos { return _pounds * 0.45; }
  get inches {return _inches; }
  get cms { return _inches * 2.54; }

  set inches(value) {_inches = value;}
  set pounds(value) {_pounds = value;}

  // kilos / sqroot of meters
  get bmi { return kilos / sqrt(cms * 0.01) ; }
  get bmiScale {
    if (bmi > underweight[0] && bmi < underweight[1]){
      return "underweight";
    }
    if (bmi > healthy[0] && bmi < healthy[1]){
      return "healthy";
    }
    if (bmi > overweight[0] && bmi < overweight[1]){
      return "overweight";
    }
    if (bmi > obese[0] && bmi < obese[1]){
      return "obese";
    }
  }

  set kilos(value) { _pounds = value * 2.2; }
  set cms(value) { _inches = value * 0.39; }



  BmiData({double pounds = 0, double inches = 0}) {
    _pounds = pounds;
    _inches = inches;
  }
}