import 'dart:io';
import 'dart:math';

//Get player choice
String playerChoice() {
  stdout.write("Enter your choice: ");
  String choice = stdin.readLineSync()!.toLowerCase();

  switch (choice) {
    case "rock":
      return "Rock";
    case "paper":
      return "Paper";
    case "scissors":
      return "Scissors";
    default:
      return "Quit";
  }
}

//Return the Computer random choice
String computerChoice() {
  Random random = new Random();
  int choice = random.nextInt(3); //random int from 0 to 2

  switch (choice) {
    case 0:
      return "Rock";
    case 1:
      return "Paper";
    case 2:
      return "Scissors";
    default:
      return "Quit";
  }
}

//Verify if the player or the computer won
String winner(String userInput, String computerInput) {
  if (userInput == computerInput) {
    return "Tie";
  } else if (userInput == "Rock" && computerInput == "Scissors") {
    return "You Win!";
  } else if (userInput == "Scissors" && computerInput == "Paper") {
    return "You Win!";
  } else if (userInput == "Paper" && computerInput == "Rock") {
    return "You Win!";
  } else {
    return "Computer Wins!";
  }
}

void solve() {
  while (true) {
    print("Rock, Paper, Scissors!\n");
    String userInput = playerChoice();

    if (userInput == "Quit") {
      return; //exit
    }

    print("You choose: $userInput");
    String computerInput = computerChoice();
    print("Computer choose: $computerInput");
    print(winner(userInput, computerInput));
  }
}

void main() {
  solve();
}
