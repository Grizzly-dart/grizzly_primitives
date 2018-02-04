part of grizzly.primitives.array2d;

abstract class Axis2D<E> implements Axis2DFix<E> {
  void add(ArrayView<E> col);

  void addScalar(E v);

  void insert(int index, ArrayView<E> col);
}

abstract class Axis2DFix<E> implements Axis2DView<E> {
  Iterable<ArrayFix<E>> get iterable;

  Iterator<ArrayFix<E>> get iterator;

  ArrayFix<E> operator [](int r);

  operator []=(int index, ArrayView<E> v);

  // TODO set?

  void sort({bool descending: false});
}

abstract class Axis2DView<E> {
  Iterable<ArrayView<E>> get iterable;

  Iterator<ArrayView<E>> get iterator;

  ArrayView<E> operator [](int r);

  int get length;

  int get otherDLength;

  // TODO pairAt

  // TODO enumerate

  Array<E> get min;

  Array<E> get max;

  // TODO slice?

  Iterable<Array<E>> unique();

  Array<E> makeArray(Iterable<E> newData);
}