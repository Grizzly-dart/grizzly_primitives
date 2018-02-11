part of grizzly.primitives.series;

abstract class DynamicSeriesBase<LT>
    implements Series<LT, dynamic>, DynamicSeriesFixBase<LT> {}

abstract class DynamicSeriesFixBase<LT>
    implements SeriesFix<LT, dynamic>, DynamicSeriesViewBase<LT> {}

abstract class DynamicSeriesViewBase<LT> implements SeriesView<LT, dynamic> {}
