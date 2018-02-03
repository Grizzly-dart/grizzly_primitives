part of grizzly.primitives.array2d;

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

  void sort({bool descending: false});
}

abstract class Axis2DView<E> {
  Iterable<Array<E>> get iterable;

  Iterator<Array<E>> get iterator;

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