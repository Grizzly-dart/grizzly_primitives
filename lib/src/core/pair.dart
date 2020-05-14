part of grizzly.primitives;

/// Data structure to hold a key-value pair
///
///     final p1 =  Pair<int, String>(1, 'one');
///     print(p1.key);  // => 1
///     print(p1.value);  // => one
class Pair<KT, VT> {
  /// Key
  final KT key;

  /// Value
  final VT value;

  /// Creates a pair with key [key] and value [value]
  const Pair(this.key, this.value);

  @override
  String toString() => '$key:$value';
}

/// [Pair] with integer key
///
///     final p1 = IntPair<String>(1, 'one');
///     print(p1.key);  // => 1
///     print(p1.value);  // => one
class IntPair<VT> extends Pair<int, VT> {
  /// Creates a pair with given integer key [key] and value [value]
  IntPair(int key, VT value) : super(key, value);
}

/// Convenience method to create a [Pair] with key [key] and value [value]
///
///     final p1 = pair<int, String>(1, 'one');
///     print(p1.key);  // => 1
///     print(p1.value);  // => one
Pair<KT, VT> pair<KT, VT>(KT key, VT value) => Pair<KT, VT>(key, value);

/// Convenience method to create an [IntPair] with key [key] and value [value]
///
///     final p1 = intPair<String>(1, 'one');
///     print(p1.key);  // => 1
///     print(p1.value);  // => one
IntPair<VT> intPair<VT>(int key, VT value) => IntPair(key, value);
