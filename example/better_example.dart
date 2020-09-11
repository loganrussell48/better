import 'dart:io';
import 'dart:math' as Math;

import 'package:better/better.dart';
import 'package:better/src/Utils/RegexUtils.dart';
import 'package:intl/intl.dart';

//TODO: Changes here should also be made to the readme
void main() {
  // Stats for list of ints
  print('\n\nStats for list of ints\n=======================================================================================');
  // Generates 20 random numeric strings with length 0-3 digits long
  // Then mapped to ints
  var gen = RandomStrings.numericList(count: 20, stringLength: 3, randomizeLength: true).map(int.parse).toList();
  print(gen.stats);
  var r = Math.Random();
  var length = r.nextInt(1 << 12);
  print('generating list...');
  var list = [for(int i = 0; i < length; i++) r.nextInt(1 << 31)];
  print('list generated');
  print('calculating stats');
  var start = DateTime.now().millisecondsSinceEpoch;
  var stats = list.stats;
  var end = DateTime.now().millisecondsSinceEpoch;
  print('Finished calculating stats in ${end - start} ms');
  print('keep in mind that the product of all the values may be huge - thousands of digits long');
  print(stats);
  print('number of digits in product: ${NumberFormat(',###').format(stats.product.toString().length)}');

  // String generation & sorting with comparators
  print('\n\nString generation & sorting with comparators\n=======================================================================================');
  var numStrings = r.nextInt(20) + 1;
  var strings = [for(var i in numStrings.range) RandomStrings.alpha(Math.Random().nextInt(10))];
  strings = RandomStrings.alphaList(count: 7, stringLength: 8, randomizeCount: false, randomizeLength: true);
  print('Unsorted: \t$strings (scrambled list, as they were generated)');
  print('Sorted: \t${strings..sort(Strings.shortestFirst)} (shortest first)');
  print('Sorted: \t${strings..sort(Strings.shortestFirst.reversed)} (shortest first, then reversed)');
  print('Sorted: \t${strings..sort(Strings.longestFirst)} (longest first, same as above)');

  // Pattern Matching / Regex
  print('\n\nPattern Matching / Regex\n=======================================================================================');

  print("RegexUtils.isValidEmailAddress('logan.w.russell@gmail.com') -> \t${RegexUtils.isValidEmailAddress('logan.w.russell@gmail.com')}");
  print("'logan.w.russell@gmail.com'.isValidEmail -> \t\t\t\t\t${'logan.w.russell@gmail.com'.isValidEmail}");
  print("'.@gmail.com'.isValidEmail -> \t\t\t\t\t\t\t\t\t${'.@gmail.com'.isValidEmail}");
  print("RegexUtils.isValidNAPhoneNumber('9375555555') -> \t\t\t\t${RegexUtils.isValidNAPhoneNumber('9375555555')}");
  print("'+19375555555'.isValidNorthAmericanPhoneNumber -> \t\t\t\t${'+19375555555'.isValidNorthAmericanPhoneNumber}");
  print("'999999'.isValidNorthAmericanPhoneNumber -> \t\t\t\t\t${'999999'.isValidNorthAmericanPhoneNumber}");

  print('\n\n\n');
  start = DateTime.now().microsecondsSinceEpoch;
  var val = 100;
  var fact = val.factorial;
  end = DateTime.now().microsecondsSinceEpoch;
  print('Finished calculating factorial in ${end - start} μs');
  print('$val! = $fact\n\n');

  var arr = [0,7,4,-6,2,1,8,6,4,9,2,5,4,6,8,5,4,3,0,0,0,0,0,5,1,2,3,6];
  print(arr.prefixSum);
  print(arr.reversed.toList().prefixSum);

  print('\n\n');
  gen = RandomStrings.numericList(count: 50000, stringLength: 10, randomizeLength: true).map(int.parse).toList();
  print('Unsorted: \t\t\t\t$gen');
  start = DateTime.now().microsecondsSinceEpoch;
  var radixSorted = gen.radixSorted;
  end = DateTime.now().microsecondsSinceEpoch;
  print('Binary Radix Sorted: \t$radixSorted in ${end - start} μs');
  start = DateTime.now().microsecondsSinceEpoch;
  var defaultSorted = gen..sort();
  end = DateTime.now().microsecondsSinceEpoch;
  print('Sorted:   \t\t\t\t$defaultSorted in ${end - start} μs');
}
