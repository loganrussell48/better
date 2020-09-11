class IntSummaryStatistics {
  int _min = ~(1 << 63);
  int _max = 1 << 63;
  int _range = (1 << 63) - (~(1 << 63));
  int _count = 0;
  num _average = 0;
  BigInt _sum = BigInt.zero;
  BigInt _prod = BigInt.one;

  IntSummaryStatistics(Iterable<int> iterable) {
    if (iterable.isEmpty) return;
    var it = iterable.iterator;
    while (it.moveNext()) {
      _count++;
      _sum += BigInt.from(it.current);
      _prod *= BigInt.from(it.current);
      if (it.current < _min) _min = it.current;
      if (it.current > _max) _max = it.current;
    }
    _range = _max - _min;
    _average = _sum / BigInt.from(_count);
  }

  int get min => _min;

  int get max => _max;

  int get range => _range;

  int get count => _count;

  double get average => _average;

  BigInt get sum => _sum;

  BigInt get product => _prod;

  @override
  String toString() {
    return 'IntSummaryStatistics{min: $min, max: $max, range: $range, count: $count, average: $average, sum: $sum, prod: $product}';
  }
}
