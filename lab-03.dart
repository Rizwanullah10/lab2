import 'dart:io';

void main() {
  print("Input your age:");

  try {
    String? userResponse = stdin.readLineSync();

    if (userResponse == null || userResponse.trim().isEmpty) {
      throw Exception("Error: No age entered.");
    }

    int currentAge = int.parse(userResponse);

    if (currentAge < 0 || currentAge > 120) {
      throw Exception("Error: Age must be between 0 and 120.");
    }

    int yearsRemaining = 100 - currentAge;
    if (yearsRemaining > 0) {
      print("You have $yearsRemaining years left until you turn 100.");
    } else {
      print("You are already 100 years old or beyond!");
    }
  } catch (e) {
    print(e);
  }
}