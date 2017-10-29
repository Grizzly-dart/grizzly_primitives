import 'package:grizzly_primitives/grizzly_primitives.dart';

main() {
  final p1 = intPair<String>(1, 'one');
  print(p1.key); // => 1
  print(p1.value); // => one

  final i1 = idx1D(5);
  print(i1.dim); // => 1
  print(i1.x); // => 5
  print(i1[0]); // => 5
  print(i1.toList()); // => [5]

  print(i1 == [5]); // => true
  print(i1 == [2]); // => false

  print(i1 > idx1D(2)); // => true
  print(i1 > idx1D(10)); // => false
  print(i1 >= idx1D(2)); // => true
  print(i1 >= idx1D(10)); // => false
  print(i1 >= idx1D(5)); // => true

  print(i1 < idx1D(2)); // => false
  print(i1 < idx1D(10)); // => true
  print(i1 <= idx1D(2)); // => false
  print(i1 <= idx1D(10)); // => true
  print(i1 <= idx1D(5)); // => true

  final i2 = idx2D(5, 25);
  print(i2.dim); // => 2
  print(i2.row); // => 5
  print(i2.col); // => 25
  print(i2[0]); // => 5
  print(i2[1]); // => 25
  print(i2.toList()); // => [5, 25]

  print(i2 == [5, 25]); // => true
  print(i2 == [5, 24]); // => false

  print(i2 > idx2D(0, 0)); // => true
  print(i2 > idx2D(10, 20)); // => false
  print(i2 >= idx2D(5, 5)); // => true
  print(i2 >= idx2D(4, 30)); // => false
  print(i2 >= idx2D(5, 25)); // => true

  print(i2 < idx2D(4, 30)); // => false
  print(i2 < idx2D(10, 30)); // => true
  print(i2 <= idx2D(10, 20)); // => false
  print(i2 <= idx2D(10, 30)); // => true
  print(i2 <= idx2D(5, 25)); // => true
}
