import 'dart:io';
import 'dart:math';
import 'package:emojis/emojis.dart';

var score = 0;
var botScore = 0;

void main(List<String> arguments) {
  for (var i = 0; i < 3; i++) {
    game();
  }
}

var options = <String>['papel', 'gunting', 'bato'];

final _random = Random();

void game() {
  print('Papel, Gunting, Bato! What\'s your Pick? ');
  var choice = stdin.readLineSync();
  var choiceInsensitive = choice.toLowerCase();

  while (!(options.contains(choiceInsensitive))) {
    print('Invalid input! Enter again...');
    choice = stdin.readLineSync();
    choiceInsensitive = choice.toLowerCase();
  }
  if (choiceInsensitive == 'papel') {
    print('You entered: ${Emojis.rollOfPaper}');
  } else if (choiceInsensitive == 'gunting') {
    print('You entered: ${Emojis.scissors}');
  } else if (choiceInsensitive == 'bato') {
    print('You entered: ${Emojis.gemStone}');
  }

  var bot = options[_random.nextInt(options.length)];

  if (bot == 'papel') {
    print('Bot entered: ${Emojis.rollOfPaper}');
  } else if (bot == 'gunting') {
    print('Bot entered: ${Emojis.scissors}');
  } else if (bot == 'bato') {
    print('Bot entered: ${Emojis.gemStone}');
  }

  while (bot == choiceInsensitive) {
    print('Same, Enter again...');
    choice = stdin.readLineSync();
    choiceInsensitive = choice.toLowerCase();
    if (choiceInsensitive == 'papel') {
      print('You entered: ${Emojis.rollOfPaper}');
    } else if (choiceInsensitive == 'gunting') {
      print('You entered: ${Emojis.scissors}');
    } else if (choiceInsensitive == 'bato') {
      print('You entered: ${Emojis.gemStone}');
    }
    bot = options[_random.nextInt(options.length)];
    if (bot == 'papel') {
      print('Bot entered: ${Emojis.rollOfPaper}');
    } else if (bot == 'gunting') {
      print('Bot entered: ${Emojis.scissors}');
    } else if (bot == 'bato') {
      print('Bot entered: ${Emojis.gemStone}');
    }
  }

  if (choiceInsensitive == 'papel' && bot == 'bato') {
    print('You Win!');
    score++;
  } else if (choiceInsensitive == 'bato' && bot == 'gunting') {
    print('You Win!');
    score++;
  } else if (choiceInsensitive == 'gunting' && bot == 'papel') {
    print('You Win!');
    score++;
  } else {
    print('You Lose!');
    botScore++;
  }

  print('You: $score');
  print('Bot: $botScore');
}
