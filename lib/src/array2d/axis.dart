part of grizzly.primitives.array2d;

abstract class Axis2D<E> {
  void add(Iterable<E> col);

  void addScalar(E v);

  void insert(int index, Iterable<E> col);

  Iterable<ArrayFix<E>> get iterable;

  ArrayFix<E> operator [](int r);

  operator []=(int index, Iterable<E> v);

  // TODO set?

  void sort({bool descending = false});

  void swap(int i, int j);

  int get length;

  int get otherDLength;

  // TODO pairAt

  // TODO enumerate

  Array<E> get min;

  Array<E> get max;

  ArrayView<int> get argMin;

  ArrayView<int> get argMax;

  // TODO slice?

  Iterable<Array<E>> unique();

  Array<E> makeArray(Iterable<E> newData);
}
