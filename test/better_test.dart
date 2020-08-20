import 'package:better/better.dart';
import 'package:test/test.dart';

void main() {
  group('BIterable<int>', () {
    late List<int> emptyList;
    late Set<int> emptySet;
    late BigInt res;
    setUp(() {
      emptyList = <int>[];
      emptySet = <int>{};
      res = emptyList.sum;
    });

    test('has sum 0 when empty', () {
      res = emptyList.sum;
      expect(res, equals(BigInt.zero));
      res = emptySet.sum;
      expect(res, equals(BigInt.zero));
    });

    test('has product 1 when empty', () {
      res = emptyList.product;
      expect(res, equals(BigInt.one));
      res = emptySet.product;
      expect(res, equals(BigInt.one));
    });
  });
}
