part of grizzly.primitives.series;

class SeriesByPosition<LT, VT> implements SeriesViewByPosition<LT, VT> {
  final Series<LT, VT> series;

  SeriesByPosition(this.series);

  VT operator [](int position) => series.getByPos(position);

  operator []=(int position, VT value) => series.setByPos(position, value);

  VT get(int position) => series.getByPos(position);

  void set(int position, VT value) => series.setByPos(position, value);

  /// Returns label at position
  LT labelAt(int position) => series.labelAt(position);

  Pair<LT, VT> pairByPos(int pos) => series.pairByPos(pos);
}

class SeriesViewByPosition<LT, VT> {
  final SeriesView<LT, VT> series;

  SeriesViewByPosition(this.series);

  VT operator [](int position) => series.getByPos(position);

  VT get(int position) => series.getByPos(position);

  /// Returns label at position
  LT labelAt(int position) => series.labelAt(position);

  Pair<LT, VT> pairByPos(int pos) => series.pairByPos(pos);
}
