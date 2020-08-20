import 'dart:math';

import 'package:better/better.dart';

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
}
