import 'dart:io';

void main() {
  File file = File('input.txt');
  List<String> lines = file.readAsLinesSync();
  int sum = 0;

  for (String line in lines) {
    String numbers = line
        .replaceAllMapped(
            RegExp(r'(one|two|three|four|five|six|seven|eight|nine)'),
            (match) => _getNumber(match.group(1)!))
        .replaceAllMapped(
            RegExp(r'(one|two|three|four|five|six|seven|eight|nine)'),
            (match) => _getNumber(match.group(1)!))
        .replaceAll(new RegExp(r'[^0-9]'), '');
    int value = int.parse(numbers[0] + numbers[numbers.length - 1]);
    sum += value;
  }
  print(sum);
}

String _getNumber(String? numberString) {
  switch (numberString) {
    case 'one':
      return '1e';
    case 'two':
      return '2o';
    case 'three':
      return '3e';
    case 'four':
      return '4';
    case 'five':
      return '5e';
    case 'six':
      return '6';
    case 'seven':
      return '7n';
    case 'eight':
      return '8t';
    case 'nine':
      return '9e';
    default:
      return '';
  }
}
