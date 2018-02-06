library grizzly.primitives.array;

import 'package:grizzly_primitives/src/core/core.dart';
import 'package:grizzly_primitives/src/series/series.dart';
import 'package:grizzly_primitives/src/array2d/array2d.dart';

part 'numeric.dart';
part 'string.dart';

/// A mutable 1 dimensional array of element [E]
abstract class Array<E> implements ArrayFix<E> {
  void add(E a);

  void insert(int index, E a);

  void mask(Array<bool> mask);
}

/// A mutable 1 dimensional fixed sized array of element [E]
abstract class ArrayFix<E> implements ArrayView<E> {
  operator []=(int i, E val);

  // TODO [Index] based indexing

  void set(E v);

  void assign(ArrayView<E> other);

  ArrayFix<E> get fixed;

  void sort({bool descending: false});
}

/// A read-only 1 dimensional array of element [E]
abstract class ArrayView<E> {
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

  Iterable<E> get iterable;

  Iterator<E> get iterator;

  Iterable<int> get i;

  /* TODO
  Series<E, int> valueCounts(
      {bool sortByValue: false,
      bool ascending: false,
      bool dropNull: false,
      dynamic name});
      */
}

abstract class BoolArrayView implements ArrayView<bool> {
  bool get allTrue;

  bool get allFalse;

  bool get anyTrue;

  bool get anyFalse;

  Numeric1D<int> toIntArray({int trueVal: 1, int falseVal: 0});

  ArrayView<bool> toStringArray(
      {String trueVal: 'True', String falseVal: 'False'});

  ArrayView<dynamic> toDynamic({trueVal: 1, falseVal: 0});
}

abstract class DynamicArrayView implements ArrayView<dynamic> {
  Numeric1D<int> toIntArray({int defaultValue, int onInvalid(value)});

  Numeric1D<double> toDoubleArray({int defaultValue, int onInvalid(value)});

  BoolArrayView toBoolArray({int defaultValue, int onInvalid(value)});

  StringArray toStringArray({int defaultValue, int onInvalid(value)});
}
