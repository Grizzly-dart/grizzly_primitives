part of grizzly.primitives.array2d;

abstract class Numeric2D<E extends num> implements Array2D<E>, Numeric2DFix<E> {
  Numeric2DAxis<E> get row;

  Numeric2DAxis<E> get col;
}

abstract class Numeric2DFix<E extends num>
    implements Array2DFix<E>, Numeric2DView<E> {
  Numeric2DAxisFix<E> get row;

  Numeric2DAxisFix<E> get col;

  Numeric1DFix<E> operator [](int i);

  void clip({E min, E max});

  Numeric2D<E> addition(/* int | Iterable<int> | Numeric2DArray */ other,
      {bool self: false});

  Numeric2D<E> subtract(/* int | Iterable<int> | Numeric2DArray */ other,
      {bool self: false});

  Numeric2D<E> multiply(/* int | Iterable<int> | Numeric2DArray */ other,
      {bool self: false});

  Numeric2D<double> divide(/* int | Iterable<int> | Numeric2DArray */ other,
      {bool self: false});

  Numeric2D<int> truncDiv(/* int | Iterable<int> | Numeric2DArray */ other,
      {bool self: false});
}

abstract class Numeric2DView<E extends num> implements Array2DView<E> {
  Numeric2DAxisView<E> get row;

  Numeric2DAxisView<E> get col;

  Numeric1DView<E> operator [](int i);

  // TODO E get ptp;

  Extent<E> get extent;

  double get mean;

  E get sum;

  double average(Iterable<Iterable<num>> weights);

  double get variance;

  double get std;

  Array2D<double> get toDouble;

  // TODO Array2D<double> get toInt;

  Array2D<double> get covMatrix;

  Array2D<double> get corrcoefMatrix;

  Numeric1D<E> dot(IterView<num> other);

  Array2D<double> get log;

  Array2D<double> get log10;

  Array2D<double> logN(double n);

  Array2D<double> get exp;

  Numeric2D<E> operator +(/* num | Iterable<num> | Numeric2DArray */ other);

  Numeric2D<E> addition(/* num | Iterable<num> | Numeric2DArray */ other);

  Numeric2D<E> operator -(/* num | Iterable<num> | Numeric2DArray */ other);

  Numeric2D<E> subtract(/* num | Iterable<num> | Numeric2DArray */ other);

  Numeric2D<E> operator *(/* num | Iterable<num> | Numeric2DArray */ other);

  Numeric2D<E> multiply(/* num | Iterable<num> | Numeric2DArray */ other);

  Numeric2D<double> operator /(
      /* num | Iterable<num> | Numeric2DArray */ other);

  Numeric2D<double> divide(/* num | Iterable<num> | Numeric2DArray */ other);

  Numeric2D<int> operator ~/(
      /* num | Iterable<num> | Numeric2DArray */ other);

  Numeric2D<int> truncDiv(/* num | Iterable<num> | Numeric2DArray */ other);

  Numeric2DView<E> operator -();

  /* TODO
  Array<bool> operator <(/* Numeric1D | num */ other);

  Array<bool> operator <=(/* Numeric1D | num */ other);

  Array<bool> operator >(/* Numeric1D | num */ other);

  Array<bool> operator >=(/* Numeric1D | num */ other);
  */

  Numeric2DView<E> get view;
}
