part of grizzly.primitives.series;

abstract class StringSeriesBase<LT>
    implements StringSeriesFixBase<LT>, Series<LT, String> {}

abstract class StringSeriesFixBase<LT>
    implements StringSeriesViewBase<LT>, SeriesFix<LT, String> {}

abstract class StringSeriesViewBase<LT> implements SeriesView<LT, String> {}
