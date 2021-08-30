part of grizzly.primitives.array;

abstract class Stats<T extends num> {
  Iterable<T> get values;

  int get length;

  T operator [](int index);

  T get min;

  T get max;

  Extent<T> get extent;

  /// Peek to peek difference of data
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

  Numeric1D<double> covMatrix(Numeric2D y);

  double corrcoef(Numeric1DView y);

  Numeric1D<double> corrcoefMatrix(Numeric2D y);

  String describe();
}
