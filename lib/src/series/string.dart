part of grizzly.primitives.series;

abstract class StringSeriesBase<LT>
    implements StringSeriesFixBase<LT>, Series<LT, String> {}

abstract class StringSeriesFixBase<LT>
    implements StringSeriesViewBase<LT>, SeriesFix<LT, String> {
  /// Data of the series
  StringArrayFix get data;
}

abstract class StringSeriesViewBase<LT> implements SeriesView<LT, String> {
  @override

  /// Data of the series
  StringArrayView get data;

  NumericSeries<LT, double> toDouble(
      {double defaultValue, double Function(String source) onError});

  NumericSeries<LT, int> toInt(
      {int radix, int defaultValue, int Function(String source) onError});
}
