import 'dart:math';

String generatePassword(int sizeOfPassword) {
  List<String> upperCase = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];
  List<String> lowerCase = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z'
  ];
  List<String> numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  List<String> specialCharacters = [
    '!',
    '@',
    '#',
    '%',
    '^',
    '&',
    '*',
    '(',
    ')',
    '-',
    '_',
    '=',
    '+',
    '[',
    ']',
    '{',
    '}',
    '|',
    '\\',
    ':',
    ';',
    '<',
    ',',
    '>',
    '.',
    '/',
    '?',
    '~',
  ];
  // int sizeOfPassword = 9;
  List<String> allCharacters = [
    ...upperCase,
    ...lowerCase,
    ...numbers,
    ...specialCharacters
  ];

  String generatedPassword = '';
  for (int i = 0; i < sizeOfPassword; i++) {
    int randomIndex = Random().nextInt(allCharacters.length);
    generatedPassword += allCharacters[randomIndex];
  }

  return generatedPassword;
}
