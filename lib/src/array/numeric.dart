part of grizzly.primitives.array;

/// A mutable 1 dimensional array of numbers
abstract class Numeric1D<E extends num> implements Array<E>, Numeric1DFix<E> {}

/// A mutable 1 dimensional fixed sized array of numbers
abstract class Numeric1DFix<E extends num>
    implements ArrayFix<E>, Numeric1DView<E> {
  void clip({E min, E max});

  void negate();

  void addition(/* E | Iterable<E> */ other);

  void subtract(/* E | Iterable<E> */ other);

  void multiply(/* E | Iterable<E> */ other);

  void divide(/* E | Iterable<E> */ other);

  void truncDiv(/* E | Iterable<E> */ other);
}

/// A read-only 1 dimensional array of numbers
abstract class Numeric1DView<E extends num> implements ArrayView<E> {
  Numeric1D<E> slice(int start, [int end]);

  Numeric1D<E> clone();

  Numeric2D<E> get transpose;

  Numeric2D<E> to2D();

  Numeric2D<E> diagonal({Index2D shape, num def: 0});

  Numeric2D<E> repeat({int repeat: 1, bool transpose: false});

  Numeric1DView<E> get view;

  /// Returns the unique items in the array
  Numeric1D<E> unique();

  double get mean;

  E get sum;

  E get prod;

  Numeric1DView<E> get cumsum;

  Numeric1DView<E> get cumprod;

  double average(Iterable<num> weights);

  double get variance;

  double get std;

  Stats<E> get stats;

  Numeric1D<E> operator -();

  Numeric1D<E> operator +(/* num | Numeric1DView | Numeric2DView */ other);

  Numeric1D<E> operator -(/* num | Numeric1DView | Numeric2DView */ other);

  Numeric1D<E> operator *(/* num | Numeric1DView | Numeric2DView */ other);

  Numeric1D<double> operator /(/* num | Numeric1DView | Numeric2DView */ other);

  Numeric1D<int> operator ~/(/* num | Numeric1DView | Numeric2DView */ other);

  Numeric1DFix<E> abs();

  E dot(IterView<num> other);

  Array<double> get log;

  Array<double> get log10;

  Array<double> logN(double n);

  Array<double> get exp;

  Numeric1D<double> get toDouble;

  Numeric1D<int> get toInt;
}

abstract class Stats<T extends num> {
  IterView<T> get values;

  int get length;

  T operator [](int index);

  T get min;

  T get max;

  Extent<T> get extent;

  T get ptp;

  T get mode;

  T get median;

  double average(Iterable<num> weights);

  double get mean;

  double get variance;

  double get std;

  int count(T v);

  int get countNonNull;

  T get sum;

  T get prod;

  double cov(Numeric1DView y);

  Numeric1D<double> covMatrix(Numeric2DView y);

  double corrcoef(Numeric1DView y);

  Numeric1D<double> corrcoefMatrix(Numeric2DView y);

  String describe();
}
