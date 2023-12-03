import 'Draw.dart';

class Game {
  int id;
  List<Draw> draws;

  Game(this.draws, this.id);

  factory Game.fromLine(String line) {
    String sanitizedLine = line.split(": ")[1];
    String beforeColon = line.split(": ")[0];
    int gameNumber = int.parse(beforeColon.split(" ")[1]);

    List<String> drawStrings = sanitizedLine.split(';');
    List<Draw> draws =
        drawStrings.map((drawString) => Draw.fromLine(drawString)).toList();
    return new Game(draws, gameNumber);
  }

  bool isValid() {
    return draws.every((draw) => draw.isValid());
  }

  int get power {
    int minRed = draws
        .reduce((maxValue, next) => next.red > maxValue.red ? next : maxValue)
        .red;
    int minGreen = draws
        .reduce(
            (maxValue, next) => next.green > maxValue.green ? next : maxValue)
        .green;
    int minBlue = draws
        .reduce((maxValue, next) => next.blue > maxValue.blue ? next : maxValue)
        .blue;
    return minRed * minGreen * minBlue;
  }

  @override
  String toString() {
    return "Game Number: $id, Draws: $draws";
  }
}
