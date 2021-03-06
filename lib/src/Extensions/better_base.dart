import 'dart:collection';
import 'dart:math';
import 'package:meta/meta.dart';
import 'package:better/src/Utils/RegexUtils.dart';
import 'package:better/src/num_summary_stats.dart';

import '../int_summary_stats.dart';

extension BIterableT<T> on Iterable<T> {
  int countWhere(bool Function(T) predicate) {
    var count = 0;
    var it = this.iterator;
    while (it.moveNext()) {
      if (predicate(it.current)) count++;
    }
    return count;
  }

  /// Performs the given [action] on each element, providing sequential index
  /// with the element.
  void forEachIndexed(void Function(T element, int index) action) {
    var index = 0;
    for (var element in this) {
      action(element, index++);
    }
  }
}
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


extension BListInt on List<int> {
  List<int> get prefixSum {
    var clone = this.clone;
    clone.forEachIndexed((elem, ind) => clone[ind] += (ind >= 1) ? clone[ind-1] : 0);
    return clone;
  }

  List<int> get clone => [...this];

  List<int> get radixSorted {
    var q0 = Queue(), q1 = Queue();
    var bits = 32;
    for( var i = 0, mask = 1; i < bits; ++i, mask <<= 1 ) {
      var t0 = 0, t1 = 0;
      for (var i = 0; i < length; ++i ) {
        if ( (this[i] & mask) == 0 ) {
          q0.add(this[i]);
        } else {
          q1.add(this[i]);
        }
      }
      var i = 0;
      while(q0.isNotEmpty){
        this[i++] = q0.removeFirst();
      }
      while(q1.isNotEmpty){
        this[i++] = q1.removeFirst();
      }
    }
    return this;
  }
}

extension Ints on int {
  Iterable<int> get range => this < 0 ? [this, 0].asRange : [0, this].asRange;

  BigInt get factorial => [for(int i = 2; i <= this; i++) i].fold(BigInt.one, (l, r) => BigInt.from(r)*l);
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

extension BIterableString on Iterable<String> {}



extension Strings on String {
  static Comparator<String> get shortestFirst => (a, b) => a.length - b.length;

  static Comparator<String> get longestFirst => (a, b) => b.length - a.length;
}

extension Chars on Random {
  static int get randAlpha => Random().nextInt(26) + 65 + Bit.random * 32;

  static int get randAlphaLower => Random().nextInt(26) + 97;

  static int get randAlphaUpper => Random().nextInt(26) + 65;

  static int get randDigit => Random().nextInt(10) + '0'.codeUnitAt(0);
}

extension RandomStrings on String {
  ///generates random chars that match [a-zA-Z]
  static String alpha(int length) {
    return String.fromCharCodes([for (var i in length.range) Chars.randAlpha]);
  }

  ///generates random chars that match [A-Z]
  static String alphaUpper(int length) {
    return String.fromCharCodes(
        [for (var i in length.range) Chars.randAlphaUpper]);
  }

  ///generates random chars that match [a-z]
  static String alphaLower(int length) {
    return String.fromCharCodes(
        [for (var i in length.range) Chars.randAlphaLower]);
  }

  ///generates random chars that match [0-9]
  static String numeric(int length) {
    return String.fromCharCodes([for (var i in length.range) Chars.randDigit]);
  }

  static List<String> alphaList(
      {@Required() int count,
      @Required() int stringLength,
      bool randomizeCount = false,
      bool randomizeLength = false}) {
    return [
      for (var i in (randomizeCount ? Random().nextInt(count) : count).range)
        RandomStrings.alpha(
            randomizeLength ? Random().nextInt(stringLength) : stringLength)
    ];
  }

  static List<String> alphaLowerList(
      {@Required() int count,
      @Required() int stringLength,
      bool randomizeCount = false,
      bool randomizeLength = false}) {
    return [
      for (var i in (randomizeCount ? Random().nextInt(count) : count).range)
        RandomStrings.alphaLower(
            randomizeLength ? Random().nextInt(stringLength) : stringLength)
    ];
  }

  static List<String> alphaUpperList(
      {@Required() int count,
      @Required() int stringLength,
      bool randomizeCount = false,
      bool randomizeLength = false}) {
    return [
      for (var i in (randomizeCount ? Random().nextInt(count) : count).range)
        RandomStrings.alphaUpper(
            randomizeLength ? Random().nextInt(stringLength) : stringLength)
    ];
  }

  static List<String> numericList(
      {@Required() int count,
      @Required() int stringLength,
      bool randomizeCount = false,
      bool randomizeLength = false}) {
    if (count < 0) {
      throw ArgumentError.value(count, 'count', 'Value should be >= 0');
    }
    if (stringLength < 0) {
      throw ArgumentError.value(
          stringLength, 'stringLength', 'value should be >= 0');
    }
    return [
      for (var i in (randomizeCount ? Random().nextInt(count) : count).range)
        RandomStrings.numeric(
            randomizeLength ? Random().nextInt(stringLength) : stringLength)
    ];
  }
}

extension Bool on bool {
  /// a lot of people don't know that Random has nextBool, so this will
  /// help with discovery
  static bool get flip => Random().nextBool();

  /// returns 1 if true, 0 if false
  int get asInt => this ? 1 : 0;
}

extension Bit on bool {
  static int get random => Random().nextBool().asInt;
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
    while (it.moveNext()) {
      next = it.current;
      maximum = (cmp(maximum, next) <= 0) ? maximum : next;
    }
    return maximum;
  }
}

extension StringUtils on String {
  bool get isValidEmail => RegexUtils.isValidEmailAddress(this);

  bool get isValidNorthAmericanPhoneNumber =>
      RegexUtils.isValidNAPhoneNumber(this);

  bool get isValidDateTime => DateTime.tryParse(this) != null;
}
//extension BListComparable<T> on List<T> {
//  bool isSorted({Comparator comparator}){
//    if(isEmpty){
//      return true;
//    }
//    if(comparator == null){
//      if(T is Comparable){
//        for(var i = 0; i < length - 1; i++){
//          if((this[i] ).compareTo(this[i+1]) > 0){
//            return false;
//          }
//        }
//      }
//    }
//  }
//}
