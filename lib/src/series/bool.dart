part of grizzly.primitives.series;

abstract class BoolSeriesBase<LT>
    implements Series<LT, bool>, BoolSeriesFixBase<LT> {}

abstract class BoolSeriesFixBase<LT>
    implements SeriesFix<LT, bool>, BoolSeriesViewBase<LT> {}

abstract class BoolSeriesViewBase<LT> implements SeriesView<LT, bool> {}
