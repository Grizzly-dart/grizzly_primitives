library grizzly.primitives.array;

import 'dart:math' as math;
import 'package:grizzly_primitives/src/core/core.dart';
import 'package:grizzly_primitives/src/iter/iter.dart';
import 'package:grizzly_primitives/src/array2d/array2d.dart';
import 'package:grizzly_primitives/src/series/series.dart';

part 'numeric.dart';
part 'string.dart';

/// A mutable 1 dimensional array of element [E]
abstract class Array<E> implements ArrayFix<E>, Iter<E> {
  void add(E a);

  void insert(int index, E a);

  void mask(ArrayView<bool> mask);

  void removeAt(int pos);

  void removeAtMany(ArrayView<int> pos);

  void removeRange(int start, [int end]);

  void remove(E value);

  void removeMany(IterView<E> value);
}

/// A mutable 1 dimensional fixed sized array of element [E]
abstract class ArrayFix<E> implements ArrayView<E>, IterFix<E> {
  operator []=(int i, E val);

  // TODO [Index] based indexing

  void set(E v);

  void assign(ArrayView<E> other);

  ArrayFix<E> get fixed;

  void sort({bool descending: false});
}

/// A read-only 1 dimensional array of element [E]
abstract class ArrayView<E> implements IterView<E> {
  ArrayView<E> makeView(Iterable<E> newData);

  ArrayFix<E> makeFix(Iterable<E> newData);

  Array<E> makeArray(Iterable<E> newData);

  Index1D get shape;

  int get length;

  E operator [](int i);

  Array<E> slice(int start, [int end]);

  Array<E> clone();

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

  Array2D<E> to2D();

  Array2D<E> repeat({int repeat: 1, bool transpose: false});

  Array2D<E> get transpose;

  ArrayView<E> get view;

  /// Returns the unique items in the array
  Array<E> unique();

  // TODO Array<IntPair<E>> uniqueIndexPair();

  Array<int> uniqueIndices();

  Array<E> pickByIndices(ArrayView<int> indices);

  bool contains(E value);

  Iterator<E> get iterator;

  Iterable<int> get i;

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
}

abstract class BoolArray implements Array<bool>, BoolArrayView {}

abstract class BoolArrayView implements ArrayView<bool> {
  bool get isTrue;

  bool get isFalse;

  double get mean;

  int get sum;

  BoolArrayView operator &(Array<bool> other);

  BoolArrayView operator |(Array<bool> other);

  BoolArrayView operator ~();

  Numeric1D<int> toIntArray({int trueVal: 1, int falseVal: 0});

  StringArray toStringArray({String trueVal: 'True', String falseVal: 'False'});

  @override
  BoolArray clone();

// TODO ArrayView<dynamic> toDynamic({trueVal: 1, falseVal: 0});
}

abstract class DynamicArray implements Array<dynamic>, DynamicArrayFix {}

abstract class DynamicArrayFix implements ArrayFix<dynamic>, DynamicArrayView {}

abstract class DynamicArrayView implements ArrayView<dynamic> {
  Comparator get comparator;

  Numeric1D<int> toIntArray({int defaultValue, int onInvalid(value)});

  Numeric1D<double> toDoubleArray(
      {double defaultValue, double onInvalid(value)});

  BoolArrayView toBoolArray({bool defaultValue, bool onInvalid(value)});

  StringArray toStringArray({String defaultValue, String onInvalid(value)});
}
