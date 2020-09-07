import 'dart:math';

import 'package:better/better.dart';
import 'package:better/src/Utils/RegexUtils.dart';

//TODO: Changes here should also be made to the readme
void main() {
  // Stats for list of ints
  print('\n\nStats for list of ints\n=======================================================================================');
  var r = Random();
  var length = r.nextInt(1 << 12);
  print('generating list...');
  var list = [for(int i = 0; i < length; i++) r.nextInt(1 << 31)];
  print('list generated');
  print('calculating stats');
  var start = DateTime.now().millisecondsSinceEpoch;
  var stats = list.stats;
  var end = DateTime.now().millisecondsSinceEpoch;
  print('Finished calculating stats in ${end - start} ms');
  print(stats);

  // String generation & sorting with comparators
  print('\n\nString generation & sorting with comparators\n=======================================================================================');
  var numStrings = r.nextInt(20) + 1;
  var strings = [for(var i in numStrings.range) RandomStrings.alpha(Random().nextInt(10))];
  strings = RandomStrings.alphaList(count: 5, stringLength: 5, randomizeCount: true, randomizeLength: true);
  print('Unsorted: $strings');
  print('Sorted: ${strings..sort(Strings.shortestFirst)}');
  print('Sorted: ${strings..sort(Strings.shortestFirst.reversed)}');
  print('Sorted: ${strings..sort(Strings.longestFirst)}'); // same as above

  // Pattern Matching / Regex
  print('\n\nPattern Matching / Regex\n=======================================================================================');

  print(RegexUtils.isValidEmailAddress('logan.w.russell@gmail.com'));
  print('logan.w.russell@gmail.com'.isValidEmail);
  print('.@gmail.com'.isValidEmail);
  print(RegexUtils.isValidNAPhoneNumber('9375555555'));
  print('+19375555555'.isValidNorthAmeicanPhoneNumber);
  print('999999'.isValidNorthAmeicanPhoneNumber);
}
