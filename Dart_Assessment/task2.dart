import 'dart:io';

//Ask the user for a number and determine whether the number is prime or not.
//Do it using a function
// bool isPrime = false;

void main() {
  print('Enter the number to find prime or not..');
  int? num = int.tryParse(stdin.readLineSync()!);

  if (primeOrNot(num)) {
  } else {}
}

bool primeOrNot(int? num) {
  int? count = 0;
  for (int i = 1; i <= num!; i++) {
    if (num % i == 0) {
      count = count! + 1;
    }
  }
  if (count == 2) {
    // print('${num} is Prime');
    return true;
  } else {
    // print('${num} is Not Prime');
    return false;
  }
  // print(count);
}
