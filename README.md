A library for adding many convenience methods / getters as extensions to commonly used dart classes. 

###`Iterable<int>`
####`sum`
`BigInt get sum`
Calculates the sum of all the elements in the list. 
**Runtime**: *O(n)* 

`BigInt get product`
Calculates the product of all the elements in the list.

`IntSummaryStatistics get stats`
Returns the summary stats for this iterable. Stats include,
sum, product, max, min, count, and range
## Usage

A simple usage example:

```dart
import 'package:better/better.dart';

main() {
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
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: http://example.com/issues/replaceme
