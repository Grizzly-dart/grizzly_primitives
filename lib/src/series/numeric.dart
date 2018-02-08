part of grizzly.primitives.series;

abstract class NumericSeries<LT, VT extends num>
    implements NumericSeriesView<LT, VT>, Series<LT, VT> {}

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

  /*
  NumericSeriesView<LT, VT> operator +(
      /* E | IterView<E> | NumericSeriesView<int> */ other);

  NumericSeriesView<LT, VT> addition(
      /* E | IterView<E> | NumericSeriesView<int> */ other);

  NumericSeriesView<LT, VT> operator -(
      /* E | IterView<E> | NumericSeriesView<int> */ other);

  NumericSeriesView<LT, VT> subtract(
      /* E | IterView<E> | NumericSeriesView<int> */ other);

  NumericSeriesView<LT, VT> operator *(
      /* E | IterView<E> | NumericSeriesView<int> */ other);

  NumericSeriesView<LT, VT> multiply(
      /* E | IterView<E> | NumericSeriesView<int> */ other);

  NumericSeriesView<LT, double> operator /(
      /* E | IterView<E> | NumericSeriesView<int> */ other);

  NumericSeriesView<LT, double> divide(
      /* E | IterView<E> | NumericSeriesView<int> */ other);

  NumericSeriesView<LT, double> operator ~/(
      /* E | IterView<E> | NumericSeriesView<int> */ other);

  NumericSeriesView<LT, double> truncDiv(
      /* E | IterView<E> | NumericSeriesView<int> */ other);

  NumericSeriesView<LT, VT> operator -();

  Series<LT, bool> operator <(/* Numeric1D | num */ other);

  Series<LT, bool> operator <=(/* Numeric1D | num */ other);

  Series<LT, bool> operator >(/* Numeric1D | num */ other);

  Series<LT, bool> operator >=(/* Numeric1D | num */ other);

  VT dot(Iterable<num> other);
  */

  NumericSeries<LT, double> get log;

  NumericSeries<LT, double> get log10;

  NumericSeries<LT, double> logN(num n);

  NumericSeries<LT, double> get exp;

  // TODO pow

  NumericSeries<LT, double> get abs;

  NumericSeries<LT, double> get toDouble;

  NumericSeries<LT, int> get toInt;
}
