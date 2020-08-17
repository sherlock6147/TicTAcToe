class Board {
  var boardElements = [0, 0, 0, 0, 0, 0, 0, 0, 0];
  var isBlockedOrNot = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  display() {
    print('Board is currently:');
    print('+---+---+---+');
    for (var n = 0; n < 3; ++n) {
      String output1 = displayElement(boardElements[3 * n]),
          output2 = displayElement(boardElements[3 * n + 1]),
          output3 = displayElement(boardElements[3 * n + 2]);
      print('| $output1 | $output2 | $output3 |');
      print('+---+---+---+');
    }
  }

  String displayElement(int value) {
    switch (value) {
      case 0:
        return " ";
        break;
      case 1:
        return "O";
        break;
      case 2:
        return "X";
        break;
      default:
        return " ";
    }
  }

  makeMove(int elementNumber, int playerNumber) {
    boardElements[elementNumber] = playerNumber == 2 ? 2 : 1;
    isBlockedOrNot[elementNumber] = true;
  }

  int getPlayerNumberFromWin(int sum) {
    int playerNumber;
    double playerNum;
    if (sum % 3 == 0 && sum != 0) {
      playerNum = sum / 3;
      playerNumber = playerNum.truncate();
      return playerNumber;
    }
    return 0;
  }

  bool equalOrNot(int num1, int num2, int num3) {
    if (num1 == num2) {
      if (num2 == num3) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  int winOrNot() {
    int sum;
    for (var i = 0; i < 3; i++) {
      //Checking row wise for winning combos
      sum = boardElements[3 * i] +
          boardElements[3 * i + 1] +
          boardElements[3 * i + 2];
      if (sum % 3 == 0 &&
          sum != 0 &&
          equalOrNot(boardElements[3 * i], boardElements[3 * i + 1],
              boardElements[3 * i + 2])) {
        return getPlayerNumberFromWin(sum);
      }
    }
    sum = 0;
    for (var i = 0; i < 3; i++) {
      sum = boardElements[i] + boardElements[i + 3] + boardElements[i + 6];
      if (sum % 3 == 0 &&
          sum != 0 &&
          equalOrNot(
              boardElements[i], boardElements[i + 3], boardElements[i + 6])) {
        return getPlayerNumberFromWin(sum);
      }
    }
    sum = 0;
    sum = boardElements[0] + boardElements[4] + boardElements[8];
    if (sum % 3 == 0 &&
        sum != 0 &&
        equalOrNot(boardElements[0], boardElements[4], boardElements[8])) {
      return getPlayerNumberFromWin(sum);
    }
    sum = boardElements[2] + boardElements[4] + boardElements[6];
    if (sum % 3 == 0 &&
        sum != 0 &&
        equalOrNot(boardElements[2], boardElements[4], boardElements[6])) {
      return getPlayerNumberFromWin(sum);
    }
    return 0;
  }
}
