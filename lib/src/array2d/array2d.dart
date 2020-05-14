library grizzly.primitives.array2d;

import 'package:grizzly_primitives/src/core/core.dart';
import 'package:grizzly_primitives/src/array/array.dart';
import 'package:grizzly_range/grizzly_range.dart';

part 'axis.dart';
part 'numeric.dart';
part 'numeric_axis.dart';
part 'bool_axis.dart';
part 'string_axis.dart';
part 'dynamic_axis.dart';

abstract class Array2D<E> implements Array2DFix<E> {
  @override
  ArrayFix<E> operator [](int i);

  @override
  Axis2D<E> get row;

  @override
  Axis2D<E> get col;

  void add(Iterable<E> row);

  void addScalar(E v);

  void insert(int index, Iterable<E> row);

  void reshape(Index2D Shape);

  // TODO void flip();
}

abstract class Array2DFix<E> implements Array2DView<E> {
  @override
  ArrayFix<String> get names;

  @override
  ArrayFix<E> operator [](int i);

  operator []=(int i, Iterable<E> val);

  set diagonal(covariant dynamic v);

  @override
  Iterable<ArrayFix<E>> get rows;

  @override
  Iterable<ArrayFix<E>> get cols;

  @override
  Axis2DFix<E> get row;

  @override
  Axis2DFix<E> get col;

  void set(E v);

  void assign(Array2DView<E> other);

  Array2DFix<E> get fixed;
}

abstract class Array2DView<E> implements Iterable<Iterable<E>> {
  ArrayView<String> get names;

  Array2DView<E> makeView(Iterable<Iterable<E>> Data);

  Array2DFix<E> makeFix(Iterable<Iterable<E>> Data);

  Array2D<E> make(Iterable<Iterable<E>> Data);

  Array<E> makeArray(Iterable<E> Data);

  /// Number of rows in the array
  int get numCols;

  /// Number of columns in the array
  int get numRows;

  /// Shape of the array
  Index2D get shape;

  bool get isSquare;

  ArrayView<E> operator [](int i);

  Iterable<ArrayView<E>> get rows;

  Iterable<ArrayView<E>> get cols;

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

  /// Returns the unique items in the array by column
  Array<E> unique();

  /* TODO
  Series<E, int> valueCounts(
      {bool sortByValue: false,
      bool ascending: false,
      bool dropNull: false,
      dynamic name});
      */

  Array2D<E> reshaped(Index2D newShape);

  // TODO Array2D<E> flipped();

  Array2D<E> clone();
}
