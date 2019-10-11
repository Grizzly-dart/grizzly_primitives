library grizzly.primitives.array;

import 'package:grizzly_primitives/src/core/core.dart';
import 'package:grizzly_primitives/src/array2d/array2d.dart';
import 'package:grizzly_primitives/src/series/series.dart';

part 'numeric.dart';
part 'string.dart';
part 'bool.dart';
part 'dynamic.dart';
part 'stats.dart';

/// A mutable 1 dimensional array of element [E]
abstract class Array<E> implements ArrayFix<E> {
  String name;

  void add(E a);

  void addAll(Iterable<E> a);

  void insert(int index, E a);

  void keepIf(Iterable<bool> mask);

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

  set set(E v);

  set assign(Iterable<E> other);

  ArrayFix<E> get fixed;

  void sort({bool descending: false});
}

/// A read-only 1 dimensional array of element [E]
abstract class ArrayView<E> implements Iterable<E> {
  String get name;

  ArrayView<E> makeView(Iterable<E> newData, [String name]);

  ArrayFix<E> makeFix(Iterable<E> newData, [String name]);

  Array<E> makeArray(Iterable<E> newData, [String name]);

  Index1D get shape;

  int get length;

  E operator [](int i);

  Array<E> slice(int start, [int end]);

  Array<E> clone({String name});

  E get first;

  E get last;

  int count(E v);

  E get min;

  E get max;

  int get argMin;

  int get argMax;

  IntPair<E> pairAt(int index);

  Iterable<IntPair<E>> enumerate();

  /// Returns a new  [Array] containing first [count] elements of this array
  ///
  /// If the length of the array is shorter than [count], all elements are
  /// returned
  Array<E> head([int count = 10]);

  /// Returns a new  [Array] containing last [count] elements of this array
  ///
  /// If the length of the array is shorter than [count], all elements are
  /// returned
  Array<E> tail([int count = 10]);

  /// Returns a new  [Array] containing random [count] elements of this array
  ///
  /// If the length of the array is shorter than [count], all elements are
  /// returned
  Array<E> sample([int count = 10]);

  Array2D<E> to2D({int repeat: 1, bool t: false});

  Array2D<E> diagonal();

  ArrayView<E> get view;

  /// Returns the unique items in the array
  Array<E> unique();

  // TODO Array<IntPair<E>> uniqueIndexPair();

  Array<int> uniqueIndices();

  Array<E> pickByIndices(Iterable<int> indices);

  bool contains(Object value);

  StringArray toStringArray();

  Series<E, int> valueCounts(
      {bool sortByValue: false, bool descending: false, name});

  int compareValue(E a, E b);

  BoolArray eq(/* ArrayView | E */ other);

  BoolArray ne(/* ArrayView | E */ other);

  BoolArray operator <(/* ArrayView | E */ other);

  BoolArray operator <=(/* ArrayView | E */ other);

  BoolArray operator >(/* ArrayView | E */ other);

  BoolArray operator >=(/* ArrayView | E */ other);

  Array<E> selectIf(Iterable<bool> mask);
}
