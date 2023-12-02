import 'dart:io';

void main() {
  File file = File('input.txt');
  List<String> lines = file.readAsLinesSync();
  int sum = 0;

  for (String line in lines) {
    String numbers = line.replaceAll(new RegExp(r'[^0-9]'), '');
    int value = int.parse(numbers[0] + numbers[numbers.length - 1]);
    sum += value;
  }
  print(sum);
}
