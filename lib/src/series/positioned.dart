part of grizzly.primitives.series;

class SeriesByPosition<IT, VT> {
  final Series<IT, VT> series;

  SeriesByPosition(this.series);

  VT operator [](int position) => series.getByPos(position);

  operator []=(int position, VT value) => series.setByPos(position, value);

  VT get(int position) => series.getByPos(position);

  void set(int position, VT value) => series.setByPos(position, value);

  /// Returns label at position
  IT labelAt(int position) => series.labelAt(position);

  Pair<IT, VT> pairByPos(int pos) => series.pairByPos(pos);
}
