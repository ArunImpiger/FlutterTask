/*
Create a dictionary (in your file) of names and birthdays. 
When you run your program it should ask the user to enter a name, 
and return the birthday of that person back to them. The interaction should look something like this:
>>> Welcome to the birthday dictionary. We know the birthdays of:
Albert Einstein
Benjamin Franklin
Ada Lovelace
>>> Who's birthday do you want to look up?
Benjamin Franklin
>>> Benjamin Franklin's birthday is 01/17/1706.
*/

import 'dart:io';

Map dictionary = {
  "Albert Einstein": "12/04/1997",
  "Benjamin Franklin": "29/09/2001",
  "Ada Lovelace": "01/17/1706",
};

void main() {
  print(
      'Welcome to the birthday dictionary. We know the birthdays of: \n ${dictionary.keys}');

  String? name = stdin.readLineSync();
  bool isAvailable = dictionary.containsKey(name);
  if (isAvailable) {
    print('${dictionary[name]}');
  }
}
