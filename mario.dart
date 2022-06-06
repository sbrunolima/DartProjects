import 'dart:io';

int isNumber(String userInput) {
  int number;

  try {
    number = int.parse(userInput);
  } on FormatException {
    number = -1;
  }

  return number;
}

void main() {
  int height;
  String userInput;

  do {
    stdout.write("Height: ");
    userInput = stdin.readLineSync()!;
    height = isNumber(userInput);
  } while (height < 1 || height > 8);

  for (int i = 0; i < height; i++) {
    for (int j = height - 1; j > i; j--) {
      stdout.write(" ");
    }

    for (int y = -1; y < i; y++) {
      stdout.write("#");
    }

    stdout.write("  ");

    for (int x = -1; x < i; x++) {
      stdout.write("#");
    }

    stdout.write("\n");
  }
}
