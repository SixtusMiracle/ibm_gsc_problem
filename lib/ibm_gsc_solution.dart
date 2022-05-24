import 'package:ibm_gsc_problem/util/gsc_converter.dart';

final _converter = GSCConverter();

void display() {
  List<String> convertedInput =
      _converter.convertToGSCFromDecimal(listOfNumbers: [10, 2, 42]);
  for (var e in convertedInput) {
    print(e);
  }
}
