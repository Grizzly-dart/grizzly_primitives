part of grizzly.primitives;

/// Encloses an extent with a [lower] limit and [upper] limit, both inclusive
///
///     final extent = Extent<int>(5, 10);
class Extent<E> {
  /// Inclusive lower limit of the extent
  final E lower;

  /// Inclusive upper limit of the extent
  final E upper;

  /// Creates an extent with [lower] limit and [upper] limit
  const Extent(this.lower, this.upper);

  /// Returns limit as [List]
  List<E> asList() => <E>[lower, upper];

  /// Compares if [this] and [other] are equal
  bool operator ==(other) {
    if (other is Extent<E>) {
      if (other.lower != lower) return false;
      if (other.upper != upper) return false;
      return true;
    } else if (other is Iterable<E>) {
      if (other.length != 2) return false;
      if (other.elementAt(0) != lower) return false;
      if (other.elementAt(1) != upper) return false;
      return true;
    }
    return false;
  }

  /// Creates an [Extent] from given [Iterable] [data] by finding the minimum and
  /// maximum
  /// TODO add better docs and an example
  static Extent<E> find<E extends Comparable<E>>(Iterable<E> data) {
    E min;
    E max;
    for (E d in data) {
      if (d == null) continue;

      if (max == null || d.compareTo(max) > 0) max = d;
      if (min == null || d.compareTo(min) < 0) min = d;
    }
    return Extent<E>(min, max);
  }

  String toString() => '[$lower, $upper]';
}
