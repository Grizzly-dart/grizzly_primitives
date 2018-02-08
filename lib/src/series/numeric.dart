part of grizzly.primitives.series;

abstract class NumericSeries<LT, VT extends num>
    implements NumericSeriesView<LT, VT>, Series<LT, VT> {}

abstract class NumericSeriesView<LT, VT extends num>
    implements SeriesView<LT, VT> {
  VT get max;

  VT get min;

  NumericSeries<LT, double> get log;

  NumericSeries<LT, double> log10();

  NumericSeries<LT, double> logN(num n);

  NumericSeries<LT, double> get abs;
}
