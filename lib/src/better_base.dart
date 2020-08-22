import 'package:better/src/num_summary_stats.dart';

import 'int_summary_stats.dart';

extension BIterableInt on Iterable<int> {
  static final String _rangeInputSizeErrorMessage =
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
  Iterable<int> get asRange {
    if (length != 2) throw ArgumentError(_rangeInputSizeErrorMessage);
    var it = iterator;
    var start = (it..moveNext()).current;
    var end = (it..moveNext()).current;
    return [for (int i = start.ceil(); i <= end; i++) i];
  }
}

extension Ints on int{
  Iterable<int> get range => this < 0 ? [this, 0].asRange : [0, this].asRange;
}

extension BIterableNum on Iterable<num> {
  static final String _rangeInputSizeErrorMessage =
  '''The iterable upon which the "range" getter was invoked has invalid size.
       Make sure there are only 2 num elements in the iterable.''';

  ///Returns the sum of the elements as a BigInt to avoid overflow
  BigInt get sum => fold(BigInt.zero, (l, r) => l + BigInt.from(r));

  ///Returns the product of the elements as a BigInt to avoid overflow
  BigInt get product => fold(BigInt.one, (l, r) => l * BigInt.from(r));

  ///Returns the summary stats for this iterable. Stats include,
  ///sum, product, max, min, count, and range
  NumSummaryStatistics get stats => NumSummaryStatistics(this);

  ///returns an iterable containing all the ints in the given range, inclusive
  ///
  /// Notice that the input is `num` not `int`.
  Iterable<int> get range {
    if (length != 2) throw ArgumentError(_rangeInputSizeErrorMessage);
    var it = iterator;
    var start = (it..moveNext()).current;
    var end = (it..moveNext()).current;
    return [for (int i = start.ceil(); i <= end; i++) i];
  }
}

extension BIterableString on Iterable<String> {

}

extension BIterableT<T> on Iterable<T> {
  int countWhere(bool Function(T) predicate){
    var count = 0;
    var it = this.iterator;
    while(it.moveNext()){
      if(predicate(it.current)) count++;
    }
    return count;
  }
}

extension Strings on String {
  static Comparator<String> get shortestFirst => (a,b) => a.length - b.length;
  static Comparator<String> get longestFirst => (a, b) => b.length - a.length;
}

extension Comparators<T> on Comparator<T> {
  /// Reverses a given comparator
  ///
  /// Note: Does NOT reverse the order of elements that are equal to the comparator
  Comparator<T> get reversed => (T a, T b) => -1 * this(a, b);
}


extension BIterableComparable<T extends Comparable> on Iterable<T> {

  T max(Comparator<T> cmp) {
    var it = iterator;
    var maximum = (it..moveNext()).current;
    var next;
    while(it.moveNext()){
      next = it.current;
      maximum = (cmp(maximum, next) <= 0) ? maximum : next;
    }
    return maximum;
  }

}