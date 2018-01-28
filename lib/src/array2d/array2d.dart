library grizzly.primitives.array2d;

import 'package:grizzly_primitives/src/core/core.dart';
import 'package:grizzly_primitives/src/series/series.dart';
import 'package:grizzly_primitives/src/array/array.dart';

part 'numeric.dart';

abstract class Array2D<E> implements Array2DFix<E> {
  ArrayFix<E> operator [](int i);

  Axis2D<E> get row;

  Axis2D<E> get col;

  void add(Iterable<E> row);

  void addScalar(E v);

  void insert(int index, Iterable<E> row);

  void insertScalar(int index, E v);
}

abstract class Array2DFix<E> implements Array2DView<E> {
  ArrayFix<E> operator [](int i);

  operator []=(int i, /* Iterable<E> | ArrayView<E> */ val);

  Axis2DFix<E> get row;

  Axis2DFix<E> get col;

  void set(E v);

  void assign(Array2DView<E> other);

  Array2DView<E> get view;

  Array2DFix<E> get fixed;
}

abstract class Array2DView<E> {
  Array2DView<E> makeView(Iterable<Iterable<E>> newData);

  Array2DFix<E> makeFix(Iterable<Iterable<E>> newData);

  Array2D<E> make(Iterable<Iterable<E>> newData);

  Iterable<Iterable<E>> get iterable;

  Iterator<ArrayView<E>> get iterator;

  /// Number of rows in the array
  int get numCols;

  /// Number of columns in the array
  int get numRows;

  /// Shape of the array
  Index2D get shape;

  bool get isSquare;

  ArrayView<E> operator [](int i);

  Axis2DView<E> get row;

  Axis2DView<E> get col;

  E get min;

  E get max;

  Index2D get argMin;

  Index2D get argMax;

  // TODO IntPair<Array<E>> pairAt(int index);

  // TODO Iterable<IntPair<Array<E>>> enumerate();

  /// Returns a new  [Array] containing first [count] elements of this array
  ///
  /// If the length of the array is shorter than [count], all elements are
  /// returned
  Array2D<E> head([int count = 10]);

  /// Returns a new  [Array] containing last [count] elements of this array
  ///
  /// If the length of the array is shorter than [count], all elements are
  /// returned
  Array2D<E> tail([int count = 10]);

  /// Returns a new  [Array] containing random [count] elements of this array
  ///
  /// If the length of the array is shorter than [count], all elements are
  /// returned
  Array2D<E> sample([int count = 10]);

  Array2D<E> get transpose;

  Array<E> get diagonal;

  Array2DView<E> get view;

  /* TODO
  Series<E, int> valueCounts(
      {bool sortByValue: false,
      bool ascending: false,
      bool dropNull: false,
      dynamic name});
      */
}

abstract class Axis2D<E> implements Axis2DFix<E> {
  void add(Iterable<E> col);

  void addScalar(E v);

  void insert(int index, Iterable<E> col);

  void insertScalar(int index, E v);
}

abstract class Axis2DFix<E> implements Axis2DView<E> {
  ArrayFix<E> operator [](int r);

  operator []=(int index, Iterable<E> v);

// TODO set?

//TODO
}

abstract class Axis2DView<E> {
  ArrayView<E> operator [](int r);

  int get length;

  int get otherDLength;

  // TODO pairAt

  // TODO enumerate

  Array<E> get min;

  Array<E> get max;

// TODO slice?
}
