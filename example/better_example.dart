import 'dart:math';

import 'package:better/better.dart';

//TODO: Changes here should also be made to the readme
void main() {
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

  var numStrings = r.nextInt(20) + 1;
  var strings = [for(var i in numStrings.range) RandomStrings.alpha(Random().nextInt(10))];
  strings = RandomStrings.alphaList(count: 5, stringLength: 5, randomizeCount: true, randomizeLength: true);
  print('Unsorted: $strings');
  print('Sorted: ${strings..sort(Strings.shortestFirst)}');
  print('Sorted: ${strings..sort(Strings.shortestFirst.reversed)}');
}
