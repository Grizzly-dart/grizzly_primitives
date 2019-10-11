part of grizzly.primitives.series;

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
      /* E | IterView<E> | NumericSeriesView<E> */ other);

  NumericSeriesView<LT, VT> operator -(
      /* E | IterView<E> | NumericSeriesView<E> */ other);

  NumericSeriesView<LT, VT> operator *(
      /* E | IterView<E> | NumericSeriesView<E> */ other);

  NumericSeriesView<LT, double> operator /(
      /* E | IterView<E> | NumericSeriesView<E> */ other);

  NumericSeriesView<LT, int> operator ~/(
      /* E | IterView<E> | NumericSeriesView<E> */ other);

  NumericSeriesView<LT, VT> operator -();

/*
  VT dot(Iterable<num> other);
  */

  NumericSeries<LT, double> get log;

  NumericSeries<LT, double> get log10;

  NumericSeries<LT, double> logN(num n);

  NumericSeries<LT, double> get exp;

  // TODO pow

  NumericSeries<LT, double> get abs;

  NumericSeries<LT, double> toDouble();

  NumericSeries<LT, int> toInt();
}
