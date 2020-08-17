import 'dart:io';
import 'board.dart';
import 'player.dart';

class Game {
  Player player1, player2;
  Board currentBoard;
  int numberOfBoards = 0;
  bool gameEnd = false;

  Game() {
    player1 = new Player();
    player2 = new Player();
    currentBoard = new Board();
    player1.enterName();
    player2.enterName();
  }

  play() {
    String name1 = player1.getName(), name2 = player2.getName();
    int playLoop = 1;
    player1.number = 1;
    player2.number = 2;
    print('Welcome $name1 and $name2 \nLets have a game of Tic-Tac-Toe');
    do {
      Player currentPlayer = playLoop % 2 == 0 ? player2 : player1;
      String currentPlayerName = currentPlayer.getName();
      int row = 0,
          column = 0,
          elementNumber = 0,
          playerNumber = currentPlayer.number;
      bool inputOK = false;
      print('$currentPlayerName\'s turn');
      currentBoard.display();
      do {
        print('Make your move:\nEnter Row:');
        row = int.parse(stdin.readLineSync());
        print('Enter Column:');
        column = int.parse(stdin.readLineSync());
        if (row <= 3 && column <= 3 && row > 0 && column > 0) {
          elementNumber = (3 * (row - 1)) + (column - 1);
          if (currentBoard.isBlockedOrNot[elementNumber] == false) {
            inputOK = true;
          } else {
            print('Position not vacant');
          }
        } else {
          print('Invalid input try again\n');
        }
      } while (!inputOK);
      ++currentPlayer.moves;
      elementNumber = (3 * (row - 1)) + (column - 1);
      currentBoard.makeMove(elementNumber, playerNumber);
      int gameWin = 0;
      gameWin = currentBoard.winOrNot();
      switch (gameWin) {
        case 0:
          gameEnd = false;
          break;
        case 1:
          gameEnd = true;
          print('$name1 has won the game!!');
          currentBoard.display();
          break;
        case 2:
          gameEnd = true;
          print('$name2 has won the game!!');
          currentBoard.display();
          break;
        default:
          gameEnd = false;
      }
      ++playLoop;
    } while (gameEnd == false);
  }
}