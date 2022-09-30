/*
Create a program that will play the “cows and bulls” game with the user. 
The game works like this:
• Randomly generate a 4-digit number.
 Ask the user to guess a 4-digit number. 
 For every digit the user guessed correctly in the correct place, they have a “cow”. 
 For every digit the user guessed correctly in the wrong place is a “bull.”
• Every time the user makes a guess, tell them how many “cows” and “bulls” they have. 
Once the user guesses the correct number, the game is over. 
Keep track of the number of guesses the user makes throughout the game and tell the user at the end.
*/

import 'dart:io';
import 'dart:math';

void main() {
  final random = Random();
  String randomNumber = (1000 + random.nextInt(9999 - 1000)).toString();
  print(randomNumber);

  stdout.write("Welcome to Cows and Bulls\nType 'exit' to stop the game\n");

  int attempts = 0;

  while (true) {
    int cows = 0;
    int bulls = 0;
    attempts += 1;

    stdout.write("\nPlease choose a four digit number: ");
    String chosenNumber = stdin.readLineSync()!;

    if (chosenNumber == randomNumber) {
      print("Bullseye! You took $attempts attempts");
      break;
    } else if (chosenNumber == "exit") {
      print("Bye bye!");
      break;
    } else if (chosenNumber.length != randomNumber.length) {
      print("Incorrect number. Make sure to give 4 digit number");
      continue;
    }

    for (var i = 0; i < randomNumber.length; i++) {
      if (chosenNumber[i] == randomNumber[i]) {
        cows += 1;
      } else if (randomNumber.contains(chosenNumber[i])) {
        bulls += 1;
      }
    }
    print("\nAttempts: $attempts \nCows: $cows, Bulls: $bulls");
  }
}
