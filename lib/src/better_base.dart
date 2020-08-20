// ignore: todo
// TODO: Put public facing types in this file.

import 'int_summary_stats.dart';

extension BIterableInt on Iterable<int?> {
  BigInt get sum => fold(BigInt.zero, (l, r) => l + BigInt.from(r ?? 0));
  BigInt get product => fold(BigInt.one, (l, r) => l * BigInt.from(r ?? 1));
}

extension BIterableIntNNBD on Iterable<int> {

  static String _rangeInputSizeErrorMessage =
      '''The iterable upon which the "range" getter was invoked has invalid size.
       Make sure there are only 2 num elements in the iterable.''';

  ///Returns the sum of the elements as a BigInt to avoid overflow
  BigInt get sum => fold(BigInt.zero, (l, r) => l + BigInt.from(r));

  ///Returns the product of the elements as a BigInt to avoid overflow
  BigInt get product => fold(BigInt.one, (l, r) => l * BigInt.from(r));

  ///Returns the summary stats for this iterable. Stats include,
  ///sum, product, max, min, count, and range
  IntSummaryStatistics get stats => IntSummaryStatistics(this);

  ///returns an iterable containing all the ints in the given range, inclusive
  ///
  /// Notice that the input is `num` not `int`.
  Iterable<int> get range {
    if(length != 2) throw ArgumentError(_rangeInputSizeErrorMessage);
    var it = iterator;
    var start = (it..moveNext()).current;
    var end = (it..moveNext()).current;
    return [for(int i = start.ceil(); i <= end; i++) i];
  }

}

