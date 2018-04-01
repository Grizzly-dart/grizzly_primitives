part of grizzly.primitives.series;

abstract class StringSeriesBase<LT>
    implements StringSeriesFixBase<LT>, Series<LT, String> {}

abstract class StringSeriesFixBase<LT>
    implements StringSeriesViewBase<LT>, SeriesFix<LT, String> {
  /// Data of the series
  StringArrayFix get data;
}

abstract class StringSeriesViewBase<LT> implements SeriesView<LT, String> {
  /// Data of the series
  StringArrayView get data;

  NumericSeries<LT, double> toDouble(
      {double defaultValue, double onError(String source)});

  NumericSeries<LT, int> toInt(
      {int radix, int defaultValue, int onError(String source)});
}
