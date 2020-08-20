import 'dart:math';

import 'package:better/better.dart';

void main() {
  var r = Random();
  var length = r.nextInt(1 << 12);
  print('generating list...');
  var list = [for(int i = 0; i < length; i++) r.nextInt(1 << 31)];
  print('list generated');
  print('calculating stats');
  var start = DateTime.now();
  var stats = list.stats;
  var end = DateTime.now();
  print('Finished calculating stats in ${end.millisecondsSinceEpoch - start.millisecondsSinceEpoch} ms');
  print(stats);
  print('$length = ${stats.count}');
  print(stats.max);
  print(stats.min);
  print(stats.range);
  print(stats.sum);
  print(stats.product);
}
