part of grizzly.primitives.series;

abstract class IntNumericSeries<LT>
    implements IntNumericSeriesFix<LT>, NumericSeries<LT, int> {}

abstract class DoubleNumericSeries<LT>
    implements DoubleNumericSeriesFix<LT>, NumericSeries<LT, double> {

}

abstract class IntNumericSeriesFix<LT> extends NumericSeriesFix<LT, int> {
  void absSelf();
}

abstract class DoubleNumericSeriesFix<LT> extends NumericSeriesFix<LT, double> {
  void normalizeSelf();

  void logSelf();

  void log10Self();

  void logNSelf(num n);

  void expSelf();

  // TODO pow

  void absSelf();
}

abstract class NumericSeries<LT, VT extends num>
    implements Series<LT, VT>, NumericSeriesFix<LT, VT> {}

abstract class NumericSeriesFix<LT, VT extends num>
    implements SeriesFix<LT, VT>, NumericSeriesView<LT, VT> {
  /// Data of the series
  Numeric1DFix<VT> get data;

  void addition(
      /* E | IterView<E> | NumericSeriesView<E> | Iterable<num> */ other);

  void subtract(
      /* E | IterView<E> | NumericSeriesView<E> | Iterable<num> */ other);

  void multiply(
      /* E | IterView<E> | NumericSeriesView<E> | Iterable<num> */ other);
  void divide(
      /* E | IterView<E> | NumericSeriesView<E> | Iterable<num> */ other);

  void truncDiv(
      /* E | IterView<E> | NumericSeriesView<E> | Iterable<num> */ other);

  void negate();
}

abstract class NumericSeriesView<LT, VT extends num>
    implements SeriesView<LT, VT> {
  @override

  /// Data of the series
  Numeric1DView<VT> get data;

  VT get max;

  VT get min;

  VT get sum;

  VT get prod;

  double average(Iterable<num> weights);

  double get variance;

  double get std;

  Stats<VT> get stats;

  NumericSeriesView<LT, VT> operator +(
      /* E | Iterable<E> | NumericSeriesView<E> */ other);

  NumericSeriesView<LT, VT> operator -(
      /* E | Iterable<E> | NumericSeriesView<E> */ other);

  NumericSeriesView<LT, VT> operator *(
      /* E | Iterable<E> | NumericSeriesView<E> */ other);

  NumericSeriesView<LT, double> operator /(
      /* E | Iterable<E> | NumericSeriesView<E> */ other);

  NumericSeriesView<LT, int> operator ~/(
      /* E | Iterable<E> | NumericSeriesView<E> */ other);

  NumericSeriesView<LT, VT> operator -();

/*
  VT dot(Iterable<num> other);
  */

  DoubleNumericSeries<LT> get log;

  DoubleNumericSeries<LT> get log10;

  DoubleNumericSeries<LT> logN(num n);

  DoubleNumericSeries<LT> get exp;

  // TODO pow

  NumericSeries<LT, VT> get abs;

  DoubleNumericSeries<LT> toDouble();

  IntNumericSeries<LT> toInt();

  DoubleNumericSeries<LT> normalized();
}
