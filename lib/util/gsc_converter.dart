class GSCConverter {
  // initialize variables
  List<int> decimalCounterParts = [0, 1, -1];
  int previousQuotient = 0, currentQuotient = 0, remainder = 0;
  String currentAnswer = '', finalAnswer = '';
  List<String> convertedListOfNumbers = [];

  List<String> convertToGSCFromDecimal({required List<int> listOfNumbers}) {
    for (int decimalNumber in listOfNumbers) {
      previousQuotient =
          decimalNumber.isNegative ? decimalNumber.abs() : decimalNumber;
      while (previousQuotient != 0) {
        setCurrentQuotientAndRemainder();
        if (remainder > 1) {
          decimalTestLoop:
          for (var i = 2; i >= 0; i--) {
            var solvedQuotient =
                (previousQuotient - decimalCounterParts[i]) / 3;
            if (isWholeNumber(value: solvedQuotient)) {
              previousQuotient = solvedQuotient.round();
              buildAnswer(answer: decimalCounterParts[i].toString());
              break decimalTestLoop;
            }
          }
        } else {
          previousQuotient = currentQuotient;
          buildAnswer(answer: remainder.toString());
        }
      }
      buildAnswer(decimalNumber: decimalNumber);
    }

    return convertedListOfNumbers;
  }

  void setCurrentQuotientAndRemainder() {
    if (previousQuotient >= 3) {
      currentQuotient = previousQuotient ~/ 3;
      remainder = previousQuotient % 3;
    } else {
      remainder = previousQuotient;
      currentQuotient = 0;
    }
  }

  void buildAnswer({String? answer, int? decimalNumber}) {
    if (decimalNumber != null) {
      finalAnswer = decimalNumber.isNegative
          ? '$decimalNumber = -$currentAnswer GSC'
          : '$decimalNumber = $currentAnswer GSC';
      convertedListOfNumbers.add(finalAnswer);

      // reset necessary variables
      currentAnswer = '';
      previousQuotient = 0;
      currentQuotient = 0;
      remainder = 0;
    } else {
      currentAnswer =
          answer == '-1' ? '-$currentAnswer' : '$answer$currentAnswer';
    }
  }

  bool isWholeNumber({required var value}) => (value % 1) == 0;
}
