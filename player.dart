import 'dart:io';

class Player {
  String name;
  int moves = 0;
  int number = 0;
  int wins = 0;

  String getName() => name;

  int getMoves() => moves;

  int getWins() => wins;

  Player() {
    //print('Please enter name: ');
    //name = stdin.readLineSync();
    moves = 0;
  }

  incrementMoves() => ++moves;

  enterName() {
    print('Please enter name: ');
    name = stdin.readLineSync();
  }
}
