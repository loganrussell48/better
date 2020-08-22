class NumSummaryStatistics {
  num _min = ~(1 << 63);
  num _max = 1 << 63;
  num _range = (1 << 63) - (~(1 << 63));
  int _count = 0;
  num _sum = 0;
  num _avg = 0;
  NumSummaryStatistics(Iterable<num> iterable) {
    if (iterable.isEmpty) return;
    var it = iterable.iterator;
    while (it.moveNext()) {
      _count++;
      if (it.current < _min) _min = it.current;
      if (it.current > _max) _max = it.current;
      _sum += it.current;
    }
    _range = _max - _min;
    _avg = _sum / count;
  }

  num get min => _min;

  num get max => _max;

  num get range => _range;

  int get count => _count;

  num get average => _avg;

  num get sum => _sum;

  @override
  String toString() {
    return 'IntSummaryStatistics{min: $min, max: $max, range: $range, count: $count, average: $average, sum: $sum}';
  }
}
