part of grizzly.primitives;

/// Encloses an extent with a [lower] limit and [upper] limit, both inclusive
///
///     final extent = new Extent<int>(5, 10);
class Extent<E> {
  /// Inclusive lower limit of the extent
  final E lower;

  /// Exclusive upper limit of the extent
  final E upper;

  /// Creates an extent with [lower] limit and [upper] limit
  const Extent(this.lower, this.upper);

  /// Returns limit as [List]
  List<E> toList() => <E>[lower, upper];

  /// Creates an [Extent] from given [Iterable] [data] by finding the minimum and
  /// maximum
  /// TODO add better docs and an example
  static Extent<E> find<O, E extends Comparable<E>>(
      Iterable<O> data, E mapper(O o)) {
    E min;
    E max;
    for (O o in data) {
      final E d = mapper(o);

      if (d == null) continue;

      if (max == null || d.compareTo(max) > 0) max = d;
      if (min == null || d.compareTo(min) < 0) min = d;
    }
    return new Extent<E>(min, max);
  }

  String toString() => '[$lower, $upper]';
}
