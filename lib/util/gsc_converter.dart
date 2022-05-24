class GSCConverter {
  // initialize variables
  List<int> decimalCounterParts = [0, 1, -1];
  int? previousQuotient, currentQuotient, remainder;
  String? currentAnswer, finalAnswer;

  void convertToGSCFromDecimal({required List listOfNumbers}) {
    for (var decimalNumber in listOfNumbers) {
      previousQuotient = decimalNumber;
      while (previousQuotient != 0) {
        setCurrentQuotientAndRemainder(decimalNumber: decimalNumber);
        if (remainder! > 1) {
          decimalTestLoop:
          for (var i = decimalCounterParts.length - 1; i >= 0; i--) {
            var solvedQuotient =
                (previousQuotient! - decimalCounterParts[i]) / 3;
            if (int.tryParse(solvedQuotient.toString()) != null) {
              previousQuotient = solvedQuotient as int;
              //TODO: concatenate 'decimalCounterParts[i]' to the front of currentAnswer string
              break decimalTestLoop;
            }
          }
        } else {
          previousQuotient = currentQuotient;
          //TODO: concatenate 'remainder to the front of currentAnswer string
        }
      }
      //TODO: concatenate '[decimalNumber] = ' to the front of currentAnswer string
    }
  }

  setCurrentQuotientAndRemainder({required int decimalNumber}) {
    if (previousQuotient! >= 3) {
      currentQuotient = decimalNumber ~/ 3;
      remainder = decimalNumber % 3;
    } else {
      remainder = previousQuotient;
      currentQuotient = 0;
    }
  }
}
