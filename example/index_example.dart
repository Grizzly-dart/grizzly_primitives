import 'package:grizzly_primitives/grizzly_primitives.dart';

void main() {
  final Index1D i1 = Index1D(5);
  print(i1.dim); // => 1
  print(i1.x); // => 5
  print(i1[0]); // => 5
  print(i1.toList()); // => [5]

  print(i1 == Index1D(5)); // => true
  print(i1 == Index1D(2)); // => false

  print(i1 > Index1D(2)); // => true
  print(i1 > Index1D(10)); // => false
  print(i1 >= Index1D(2)); // => true
  print(i1 >= Index1D(10)); // => false
  print(i1 >= Index1D(5)); // => true

  print(i1 < Index1D(2)); // => false
  print(i1 < Index1D(10)); // => true
  print(i1 <= Index1D(2)); // => false
  print(i1 <= Index1D(10)); // => true
  print(i1 <= Index1D(5)); // => true

  final i2 = Index2D(5, 25);
  print(i2.dim); // => 2
  print(i2.row); // => 5
  print(i2.col); // => 25
  print(i2[0]); // => 5
  print(i2[1]); // => 25
  print(i2.toList()); // => [5, 25]

  print(i2 == Index2D(5, 25)); // => true
  print(i2 == Index2D(5, 24)); // => false

  print(i2 > Index2D(0, 0)); // => true
  print(i2 > Index2D(10, 20)); // => false
  print(i2 >= Index2D(5, 5)); // => true
  print(i2 >= Index2D(4, 30)); // => false
  print(i2 >= Index2D(5, 25)); // => true

  print(i2 < Index2D(4, 30)); // => false
  print(i2 < Index2D(10, 30)); // => true
  print(i2 <= Index2D(10, 20)); // => false
  print(i2 <= Index2D(10, 30)); // => true
  print(i2 <= Index2D(5, 25)); // => true
}
