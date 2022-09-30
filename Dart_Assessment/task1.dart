//Create a program that asks the user to enter their name and their age.
//Print out a message that tells how many years they have to be 100 years old.

import 'dart:io';

void main() {
  print('Enter your name..');
  String? name = stdin.readLineSync();
  print('Enter your age..');
  int? age = int.tryParse(stdin.readLineSync()!);

  var needAge = 100 - age!;

  print('${name} ${needAge} years you have to be 100 years old');
}
