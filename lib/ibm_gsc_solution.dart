import 'dart:io';

import 'package:ibm_gsc_problem/util/gsc_converter.dart';

void display() {
  print("Enter number to convert to GSC:");
  List<int> inputListOfNumbers = [];

  try {
    inputListOfNumbers.add(int.parse(stdin.readLineSync()!));
    convert(listOfNumbers: inputListOfNumbers);
  } on FormatException {
    print('Invalid value entered, try again!');
  }
}

convert({required List<int> listOfNumbers}) {
  print('\nConverted!');

  final _converter = GSCConverter();
  List<String> convertedInput =
      _converter.convertToGSCFromDecimal(listOfNumbers: listOfNumbers);
  for (var answer in convertedInput) {
    print(answer);
  }
}
