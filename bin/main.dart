import 'dart:math';
import '../lib/better.dart';

void main() {
  var rand = Random.secure();
  var size = rand.nextInt(100);
  var bigList = <int>[for (int i = 0; i < size; i++) rand.nextInt(1 << 31)];
  print(bigList.sum);
  print(bigList.product);
}
