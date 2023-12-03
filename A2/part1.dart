import 'dart:io';
import 'Game.dart';

void main() {
  File file = File('A2/games.txt');
  List<String> lines = file.readAsLinesSync();

  List<Game> games = lines.map((line) => Game.fromLine(line)).toList();
  // Part 1
  List<Game> validGames = games.where((game) => game.isValid()).toList();
  int sumIds =
      validGames.fold(0, (previousValue, game) => previousValue + game.id);
  print("Sum of valid games: $sumIds");

  // Part 2
  int sumPowers =
      games.fold(0, (previousValue, game) => previousValue + game.power);
  print("Sum of game powers: $sumPowers");
}
