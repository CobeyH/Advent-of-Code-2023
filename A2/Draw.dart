int MAX_RED = 12;
int MAX_GREEN = 13;
int MAX_BLUE = 14;

class Draw {
  int red;
  int green;
  int blue;

  Draw(this.red, this.green, this.blue);

  bool isValid() {
    return red <= MAX_RED && green <= MAX_GREEN && blue <= MAX_BLUE;
  }

  factory Draw.fromLine(String line) {
    List<String> drawValues = line.split(',');
    int red = 0;
    int green = 0;
    int blue = 0;

    for (String drawValue in drawValues) {
      drawValue = drawValue.trim();
      String color = drawValue.split(' ')[1];
      int value = int.parse(drawValue.split(' ')[0]);
      if (color == "red") {
        red = value;
      } else if (color == "green") {
        green = value;
      } else if (color == "blue") {
        blue = value;
      }
    }

    return new Draw(red, green, blue);
  }

  @override
  String toString() {
    return "Red: $red, Green: $green, Blue: $blue";
  }
}
