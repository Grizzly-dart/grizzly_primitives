part of grizzly.primitives.array2d;

abstract class Numeric2D<E extends num> implements Array2D<E>, Numeric2DFix<E> {
  Numeric2DAxis<E> get row;

  Numeric2DAxis<E> get col;

  Numeric1DFix<E> operator [](int i);
}

abstract class Numeric2DFix<E extends num>
    implements Array2DFix<E>, Numeric2DView<E> {
  Numeric2DAxisFix<E> get row;

  Numeric2DAxisFix<E> get col;

  Numeric1DFix<E> operator [](int i);

  void clip({E min, E max});

  void negate();

  void addition(
      /* num | Iterable<num> | Numeric2D<int> */ other);

  void subtract(
      /* num | Iterable<num> | Numeric2D<int> */ other);

  void multiply(
      /* num | Iterable<num> | Numeric2D<int> */ other);

  void divide(/* num | Iterable<num> | Numeric2D<int> */ other);

  void truncDiv(
      /* num | Iterable<num> | Numeric2D<int> */ other);

  void rdivMe(
      /* num | Iterable<num> | Numeric2D<double> */ other);

  Numeric2DFix<E> get fixed;
}

abstract class Numeric2DView<E extends num> implements Array2DView<E> {
  Numeric1DView<E> operator [](int i);

  Numeric2DAxisView<E> get row;

  Numeric2DAxisView<E> get col;

  Numeric2D<E> get transpose;

  Numeric1D<E> get diagonal;

  Numeric1D<E> unique();

  // TODO E get ptp;

  Extent<E> get extent;

  double get mean;

  E get sum;

  double average(Iterable<Iterable<num>> weights);

  double get variance;

  double get std;

  // TODO Array2D<double> get toInt;

  Array2D<double> get covMatrix;

  Array2D<double> get corrcoefMatrix;

  Numeric1D<E> dot(Iterable<num> other);

  Array2D<double> get log;

  Array2D<double> get log10;

  Array2D<double> logN(double n);

  Array2D<double> get exp;

  Numeric2D<E> operator -();

  Numeric2D<E> operator +(
      /* numInt | Iterable<num> | Numeric2D<int> */ other);

  Numeric2D<E> operator -(
      /* numInt | Iterable<num> | Numeric2D<int> */ other);

  Numeric2D<E> operator *(
      /* numInt | Iterable<num> | Numeric2D<int> */ other);

  Numeric2D<double> operator /(
      /* numInt | Iterable<num> | Numeric2D<int> */ other);

  Numeric2D<int> operator ~/(
      /* numInt | Iterable<num> | Numeric2D<int> */ other);

  Numeric2D<double> rdiv(/* num | Iterable<num> | Numeric2DArray */ other);

  Numeric2D<E> matmul(Array2DView<E> other);

  Numeric2D<E> matmulDiag(ArrayView<E> other);

  /* TODO
  Array<bool> operator <(/* Numeric1D | num */ other);

  Array<bool> operator <=(/* Numeric1D | num */ other);

  Array<bool> operator >(/* Numeric1D | num */ other);

  Array<bool> operator >=(/* Numeric1D | num */ other);
  */

  Numeric2DView<E> get view;

  Numeric2D<int> toInt();

  Numeric2D<double> toDouble();

  Numeric2D<E> reshaped(Index2D newShape);

  // TODO Numeric2D<E> flipped();

  Numeric2D<E> clone();
}
