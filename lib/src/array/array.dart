library grizzly.primitives.array;

import 'package:grizzly_primitives/src/core/core.dart';
import 'package:grizzly_primitives/src/series/series.dart';
import 'package:grizzly_primitives/src/array2d/array2d.dart';

part 'numeric.dart';

/// A mutable 1 dimensional array of element [E]
abstract class Array<E> implements ArrayFix<E> {
  void add(E a);

  void insert(int index, E a);
}

/// A mutable 1 dimensional fixed sized array of element [E]
abstract class ArrayFix<E> implements ArrayView<E> {
  operator []=(int i, E val);

  // TODO [Index] based indexing

  void set(E v);

  void assign(Iterable<E> other);

  ArrayFix<E> get fixed;
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
  Array<E> unique({bool sort: false});

  Iterable<E> get iterable;

  /* TODO
  Series<E, int> valueCounts(
      {bool sortByValue: false,
      bool ascending: false,
      bool dropNull: false,
      dynamic name});
      */
}

abstract class StringArray implements Array<String> {
  Array<bool> get isAlphaNum;

  Array<bool> get isAlphabet;

  Array<bool> get isDecimal;

  Array<bool> get isNumber;

  Array<bool> get isLower;

  Array<bool> get isSpace;

  Array<bool> get isUpper;

  Array<bool> startsWith();

  String join(String delimiter);

  void lshift(int width, [String fillchar = ' ']);

  void rshift(int width, [String fillchar = ' ']);

  void lower();

  void upper();

  void lstrip();

  void rstrip();

  // TODO split
}

abstract class BoolArray {
  bool get allTrue;

  bool get allFalse;

  bool get anyTrue;

  bool get anyFalse;
}