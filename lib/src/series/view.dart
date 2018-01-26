part of grizzly.primitives.series;

abstract class SeriesView<IT, VT> implements Series<IT, VT> {
  Series<IT, VT> toSeries();
}
