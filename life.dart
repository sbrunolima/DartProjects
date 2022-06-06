import 'dart:io';
import 'dart:math';

//Verify if the user entered a valid number
double isNumber(String userInput) {
  double number;

  try {
    number = double.parse(userInput);
  } on FormatException {
    number = -1;
  }
  return number;
}

//Solve method, here all the magic happens
void solve() {
  int day_hours = 24, year_days = 365;
  double data_return = 0;

  List input_data = [0, 0, 0, 0, 0, 0];
  List verified_data = [0, 0, 0, 0, 0, 0];

  do {
    stdout.write("1 - Enter your age: ");
    input_data[0] = stdin.readLineSync()!;

    stdout.write("2 - How many years do you want to live: ");
    input_data[1] = stdin.readLineSync()!;

    stdout.write("3 - How many years have you been working: ");
    input_data[2] = stdin.readLineSync()!;

    stdout.write("4 - Daily hours worked: ");
    input_data[3] = stdin.readLineSync()!;

    stdout.write("5 - Daily hours sleeping: ");
    input_data[4] = stdin.readLineSync()!;

    stdout.write("6 - What age do you want to retire: ");
    input_data[5] = stdin.readLineSync()!;

    print("\n");

    //Loop to verify if the user entered valid number
    for (int i = 0; i < input_data.length; i++) {
      verified_data[i] = isNumber((input_data[i]));
      if (verified_data[i] < 0) {
        print("Item ${(i + 1)} is not a valid number!");
        data_return = verified_data[i];
      }
    }

    //Restart or Exit if the user enter a invalid number
    if (data_return < 0) {
      print("\n");
      stdout.write("Try again? yes or no: ");
      String tryAgin = stdin.readLineSync()!;

      if (tryAgin.toLowerCase() == "yes") {
        main();
      } else {
        exit(0);
      }
    }
  } while (data_return < 0);

  //Variables to do all calculations
  double years_remaining; //How many years of life are left

  //Life in hours
  double lived_until_now; //How many hours have you lived since birth
  double enjoyed_until_now; //How many hours have you liked so far
  double hours_still_have; //How many hours of lives are left

  //Sum
  double sleeped_until_now; //Sum of hours slept so far
  double worked_until_now; //Sum of hours worked so far

  //Total hours spent during life
  double life_hours_sleeped; //Hours of sleep during life
  double life_hours_enjoyed; //Hours of fun during life
  double life_hours_total; //All life in hours
  double life_hours_worked; //Hours worked during life

  //Do all calculations
  years_remaining =
      verified_data[1] - verified_data[0]; //How many years of life are left

  worked_until_now = (verified_data[3] * year_days) *
      verified_data[2]; //Sum of hours worked so far
  sleeped_until_now = (verified_data[4] * year_days) *
      verified_data[0]; //Sum of hours slept so far

  lived_until_now = (verified_data[0] * year_days) *
      day_hours; //How many hours have you lived since birth
  enjoyed_until_now = lived_until_now -
      (sleeped_until_now +
          worked_until_now); //How many hours have you liked so far
  hours_still_have = (years_remaining * year_days) *
      day_hours; //How many hours of lives are left

  life_hours_sleeped = (verified_data[4] * year_days) *
      verified_data[1]; //Hours of sleep during life
  life_hours_enjoyed = (((verified_data[1] - verified_data[5]) +
              (verified_data[0] - verified_data[2])) *
          year_days) *
      day_hours; //Hours of fun during life
  life_hours_total =
      (verified_data[1] * year_days) * day_hours; //All life in hours
  life_hours_worked = life_hours_total -
      (life_hours_enjoyed + life_hours_sleeped); //Hours worked during life

  //Outputs
  print("LIFE IN HOURS/DAYS UNTIL NOW:\n");
  print(
      "Hours worked so far: ${worked_until_now} hours, or ${(worked_until_now / day_hours).toStringAsFixed(2)} days.");
  print(
      "Sleep hours so far: ${sleeped_until_now} hours, or ${(sleeped_until_now / day_hours).toStringAsFixed(2)} days.");
  print(
      "Hours lived so far: ${lived_until_now} hours, or ${(lived_until_now / day_hours).toStringAsFixed(2)} days.");
  print(
      "Enjoying hours so far: ${enjoyed_until_now} hours, or ${(enjoyed_until_now / day_hours).toStringAsFixed(2)} days.");
  print("\n");

  print("WILL LIVE IN HOURS/DAYS:\n");
  print(
      "Total hours you will live: ${life_hours_total} hours, or ${(life_hours_total / day_hours).toStringAsFixed(2)} days.\n");
  print(
      "Sleep during your lifetime: ${life_hours_sleeped} hours, or ${(life_hours_sleeped / day_hours).toStringAsFixed(2)} days.");
  print(
      "Enjoy during your lifetime: ${life_hours_enjoyed} hours, or ${(life_hours_enjoyed / day_hours).toStringAsFixed(2)} days.");
  print(
      "Work during your lifetime: ${life_hours_worked} hours, or ${(life_hours_worked / day_hours).toStringAsFixed(2)} days.\n");
  print(
      "Total hours remaining: ${hours_still_have} hours, or ${(hours_still_have / day_hours).toStringAsFixed(2)} days.");
  print("\n");

  stdout.write("Again? yes or no: ");
  String again = stdin.readLineSync()!;
  if (again.toLowerCase() == "yes") {
    main();
  } else {
    exit(0);
  }
}

//Main
void main() {
  solve();
}
