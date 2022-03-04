library grizzly.primitives.array;

import 'package:grizzly_primitives/src/core/core.dart';
import 'package:grizzly_primitives/src/array2d/array2d.dart';
import 'package:grizzly_primitives/src/series/series.dart';
import 'package:grizzly_range/grizzly_range.dart' show Extent;

part 'numeric.dart';
part 'string.dart';
part 'bool.dart';
part 'dynamic.dart';
part 'stats.dart';

/// A mutable 1 dimensional array of element [E]
abstract class Array<E> implements ArrayFix<E> {
  void add(E a);

  void addAll(Iterable<E> a);

  void insert(int index, E a);

  void keepByMask(Iterable<bool> mask);

  void removeAt(int pos);

  void removeAtMany(ArrayView<int> pos);

  void removeRange(int start, [int end]);

  void remove(E value);

  void removeMany(Iterable<E> value);

  void clear();
}

/// A mutable 1 dimensional fixed sized array of element [E]
abstract class ArrayFix<E> implements ArrayView<E> {
  operator []=(int i, E val);

  // TODO [Index] based indexing

  /// Sets all elements to [v]
  set set(E v);

  // TODO setRange

  set setAll(Iterable<E> other);

  ArrayFix<E> get fixed;

  void sort({bool descending = false});
}

/// A read-only 1 dimensional array of element [E]
abstract class ArrayView<E> implements Iterable<E> {
  ArrayView<E> makeView(Iterable<E> newData);

  ArrayFix<E> makeFix(Iterable<E> newData);

  Array<E> makeArray(Iterable<E> newData);

  Index1D get shape;

  E operator [](int i);

  Array<E> slice(int start, [int end]);

  Array<E> clone();

  int count(E v);

  E get min;

  E get max;

  /// Returns the index of min
  int get argMin;

  /// Returns the index of max
  int get argMax;

  MapEntry<int, E> pairAt(int index);

  Iterable<MapEntry<int, E>> enumerate();

  /// Returns a new  [Array] containing first [count] elements of this array
  ///
  /// If the length of the array is shorter than [count], all elements are
  /// returned
  Array<E> head([int count = 10]) {
    if (length <= count) return makeArray(this);
    return slice(0, count);
  }

  /// Returns a  [Array] containing last [count] elements of this array
  ///
  /// If the length of the array is shorter than [count], all elements are
  /// returned
  Array<E> tail([int count = 10]) {
    if (length <= count) return makeArray(this);
    return slice(length - count);
  }

  /// Returns a  [Array] containing random [count] elements of this array
  ///
  /// If the length of the array is shorter than [count], all elements are
  /// returned
  Array<E> sample([int count = 10]);

  Array2D<E> to2D({int repeat = 1, bool t = false});

  Array2D<E> diagonal();

  ArrayView<E> get view;

  /// Returns the unique items in the array
  Array<E> unique();

  // TODO Array<IntPair<E>> uniqueIndexPair();

  Array<int> uniqueIndices();

  Array<E> pickByIndices(Iterable<int> indices);

  StringArray toStringArray();

  NumericSeries<E, int> valueCounts(
      {bool sortByValue = false, bool descending = false});

  int compareValue(E a, E b);

  BoolArray eq(/* Iterable<E> | E */ other);

  BoolArray ne(/* Iterable<E> | E */ other);

  BoolArray operator <(/* Iterable<E> | E */ other);

  BoolArray operator <=(/* Iterable<E> | E */ other);

  BoolArray operator >(/* Iterable<E> | E */ other);

  BoolArray operator >=(/* Iterable<E> | E */ other);

  Array<E> selectByMask(Iterable<bool> mask);
}
