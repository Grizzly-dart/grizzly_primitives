part of grizzly.primitives.series;

abstract class NumericSeries<LT, VT extends num> implements Series<LT, VT> {
  NumericSeries<LT, double> get log;
}