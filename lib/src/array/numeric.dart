part of grizzly.primitives.array;

/// A mutable 1 dimensional array of numbers
abstract class Numeric1D<E extends num> implements Array<E>, Numeric1DFix<E> {
  Numeric1D<E> addition(/* E | Iterable<E> */ other, {bool self: false});

  Numeric1D<E> subtract(/* E | Iterable<E> */ other, {bool self: false});

  Numeric1D<E> multiply(/* E | Iterable<E> */ other, {bool self: false});

  Numeric1D<double> divide(/* E | Iterable<E> */ other, {bool self: false});

  Numeric1D<int> truncDiv(/* E | Iterable<E> */ other, {bool self: false});

}

/// A mutable 1 dimensional fixed sized array of numbers
abstract class Numeric1DFix<E extends num>
    implements ArrayFix<E>, Numeric1DView<E> {
  void clip({E min, E max});

  Numeric1DFix<E> operator +(/* E | Iterable<E> */ other);

  Numeric1DFix<E> addition(/* E | Iterable<E> */ other, {bool self: false});

  Numeric1DFix<E> operator -(/* E | Iterable<E> */ other);

  Numeric1DFix<E> subtract(/* E | Iterable<E> */ other, {bool self: false});

  Numeric1DFix<E> operator *(/* E | Iterable<E> */ other);

  Numeric1DFix<E> multiply(/* E | Iterable<E> */ other, {bool self: false});

  Numeric1DFix<double> operator /(/* E | Iterable<E> */ other);

  Numeric1DFix<double> divide(/* E | Iterable<E> */ other, {bool self: false});

  Numeric1DFix<int> operator ~/(/* E | Iterable<E> */ other);

  Numeric1DFix<int> truncDiv(/* E | Iterable<E> */ other, {bool self: false});

  void negate();
}

/// A read-only 1 dimensional array of numbers
abstract class Numeric1DView<E extends num> implements ArrayView<E> {
  double get mean;

  E get sum;

  E get prod;

  Numeric1DView<E> get cumsum;

  Numeric1DView<E> get cumprod;

  double average(Iterable<num> weights);

  double get variance;

  double get std;

  Stats<E> get stats;

  Numeric1DFix<E> operator +(/* E | Iterable<E> */ other);

  Numeric1DFix<E> addition(/* E | Iterable<E> */ other);

  Numeric1DFix<E> operator -(/* E | Iterable<E> */ other);

  Numeric1DFix<E> subtract(/* E | Iterable<E> */ other);

  Numeric1DFix<E> operator *(/* E | Iterable<E> */ other);

  Numeric1DFix<E> multiply(/* E | Iterable<E> */ other);

  Numeric1DFix<double> operator /(/* E | Iterable<E> */ other);

  Numeric1DFix<double> divide(/* E | Iterable<E> */ other);

  Numeric1DFix<int> operator ~/(/* E | Iterable<E> */ other);

  Numeric1DFix<int> truncDiv(/* E | Iterable<E> */ other);

  Numeric1DFix<E> operator -();

  Numeric1DFix<E> abs();

  E dot(Iterable<num> other);

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