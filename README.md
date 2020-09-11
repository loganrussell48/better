A library for adding many convenience methods / getters as extensions to commonly used dart classes. 

# Iterable < int >
### BigInt get sum
* Calculates the sum of all the elements in the `Iterable`. 
* **Runtime**: *O(n)* where *n* is the size of the `Iterable`

### BigInt get product
* Calculates the product of all the elements in the `Iterable`.
* **Runtime**: *O(n\*m)* where *n* is the number of elements in the `Iterable`, 
and *m* is the complexity of `BigInt`'s `*` operation (unknown at the moment)

### IntSummaryStatistics get stats
* Returns the summary stats for this iterable. Stats include,
sum, product, max, min, count, average, and range
* **Runtime**: *O(n\*m)* where *n* is the number of elements in the `Iterable`, 
  and *m* is the complexity of `BigInt`'s `*` operation (unknown at the moment)
* This is computed in one pass through the `Iterable`'s elements

## Usage
A simple usage example:

```dart
import 'package:better/better.dart';

main() {
  // Stats for list of ints
  print('\n\nStats for list of ints\n=======================================================================================');
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

  // String generation & sorting with comparators
  print('\n\nString generation & sorting with comparators\n=======================================================================================');
  var numStrings = r.nextInt(20) + 1;
  var strings = [for(var i in numStrings.range) RandomStrings.alpha(Random().nextInt(10))];
  strings = RandomStrings.alphaList(count: 5, stringLength: 5, randomizeCount: true, randomizeLength: true);
  print('Unsorted: $strings');
  print('Sorted: ${strings..sort(Strings.shortestFirst)}');
  print('Sorted: ${strings..sort(Strings.shortestFirst.reversed)}');
  print('Sorted: ${strings..sort(Strings.longestFirst)}'); // same as above

  // Pattern Matching / Regex
  print('\n\nPattern Matching / Regex\n=======================================================================================');
  print(RegexUtils.isValidEmailAddress('logan.w.russell@gmail.com'));
  print('logan.w.russell@gmail.com'.isValidEmail);
  print('.@gmail.com'.isValidEmail);
  print(RegexUtils.isValidNAPhoneNumber('9375555555'));
  print('+19375555555'.isValidNorthAmeicanPhoneNumber);
  print('999999'.isValidNorthAmeicanPhoneNumber);
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/loganrussell48/better/issues
