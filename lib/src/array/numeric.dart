part of grizzly.primitives.array;

/// A mutable 1 dimensional array of numbers
abstract class Numeric1D<E extends num> implements Array<E>, Numeric1DFix<E> {}

/// A mutable 1 dimensional fixed sized array of numbers
abstract class Numeric1DFix<E extends num>
    implements ArrayFix<E>, Numeric1DView<E> {
  void clip({E min, E max});

  void negate();

  void addition(/* num | Iterable<num> */ other);

  void subtract(/* num | Iterable<num> */ other);

  void multiply(/* num | Iterable<num> */ other);

  void divide(/* num | Iterable<num> */ other);

  void truncDiv(/* num | Iterable<num> */ other);

  void rdivMe(/* num | Iterable<num> */ other);
}

/// A read-only 1 dimensional array of numbers
abstract class Numeric1DView<E extends num> implements ArrayView<E> {
  Numeric1D<E> slice(int start, [int end]);

  Numeric1D<E> clone({String name});

  Numeric2D<E> to2D({int repeat: 1, bool t: false});

  Numeric2D<E> diagonal({Index2D shape, num def: 0});

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

  Numeric1D<E> operator +(/* num | Iterable<num> */ other);

  Numeric1D<E> operator -(/* num | Iterable<num> */ other);

  Numeric1D<E> operator *(/* num | Iterable<num> */ other);

  Numeric1D<double> operator /(/* num | Iterable<num> */ other);

  Numeric1D<int> operator ~/(/* num | Iterable<num> */ other);

  Numeric1D<double> rdiv(/* num | Iterable<num> */ other);

  Numeric1DFix<E> abs();

  E dot(Iterable<num> other);

  Array<double> get log;

  Array<double> get log10;

  Array<double> logN(double n);

  Array<double> get exp;

  Numeric1D<double> toDouble();

  Numeric1D<int> toInt();

  Numeric1D<double> sin();
}
