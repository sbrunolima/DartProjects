import 'dart:io';

bool isNumber(String inTemp) {
  //method to validate the number
  bool validator;
  int number;

  try {
    number = int.parse(inTemp);
    validator = true;
  } on FormatException {
    validator = false;
  }

  return validator;
}

void solve() {
  print("A: Convert Celsius to Fahrenheit");
  print("B: Convert Fahrenheit to Celsius");
  String selection;
  int temp = 0;
  String number;
  bool validate;

  do {
    selection = stdin.readLineSync()!.toUpperCase();
  } while (selection != "A" && selection != "B");

  //Will repeat until the user enter a invalid number
  do {
    print("Enter the starting temperature:");
    number = stdin.readLineSync()!;
    validate = isNumber(number);
  } while (!validate);

  temp = int.parse(number);

  switch (selection) {
    case "A":
      print(
          "$temp degress Celsius is ${(temp * 1.8 + 32).toStringAsFixed(2)} degrees Fahrenheit.");
      break;
    case "B":
      print(
          "$temp degress Fahrenheit is ${((temp - 32) / 1.8).toStringAsFixed(2)} degrees Celsius.");
      break;
    default:
      break;
  }
}

void main() {
  solve();
}
