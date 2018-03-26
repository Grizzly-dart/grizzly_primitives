part of grizzly.primitives;

/// Convenience method to create a 1D index with index [x]
///
///
Index1D idx1D(int x) => new Index1D(x);

/// Convenience method to create a 2D index with given [row] and [col]
Index2D idx2D(int row, int col) => new Index2D(row, col);

/// Interface for an index
abstract class Index {
  /// Number of dimensions
  int get dim;

  /// Get index at dimension [d]
  int operator [](int d);

  bool operator ==(other);

  bool operator >(Index other);

  bool operator <(Index other);

  bool operator >=(Index other);

  bool operator <=(Index other);

  /// Converts [Index] to [List] of [int]
  List<int> toList();
}

/// A 1-dimensional index
///
///     final i1 = idx1D(5);
///     print(i1.dim);  // => 1
///     print(i1.x);  // => 5
class Index1D implements Index {
  /// The index
  ///
  ///     final i1 = idx1D(5);
  ///     print(i1.x);  // => 5
  final int x;

  /// Creates an [Index] instance with given index [x]
  const Index1D(this.x);

  /// Number of dimensions
  ///
  ///     final i1 = idx1D(5);
  ///     print(i1.dim);  // => 1
  int get dim => 1;

  /// Get index at dimension [d]
  ///
  ///     final i1 = idx1D(5);
  ///     print(i1[0]);  // => 5
  int operator [](int d) {
    if (d >= dim) throw new RangeError.range(d, 0, 0, 'd', 'Out of range!');
    return x;
  }

  /// Converts [Index] to [List] of [int] with one element
  ///
  ///     final i1 = idx1D(5);
  ///     print(i1.toList()); // => [5]
  List<int> toList() => <int>[x];

  /// Checks if two [Index1D] are equal
  ///
  ///     final i1 = idx1D(5);
  ///     print(i1 == [5]); // => true
  ///     print(i1 == [2]); // => false
  bool operator ==(other) {
    if (other is Index1D) {
      return other.x == this.x;
    } else if (other is Iterable<int>) {
      if (other.length != 1) return false;
      if (other.elementAt(0) != x) return false;
      return true;
    }

    return false;
  }

  /// Compares if this [Index1D] is greater than [other]
  ///
  ///     final i1 = idx1D(5);
  ///     print(i1 > idx1D(2)); // => true
  ///     print(i1 > idx1D(10)); // => false
  bool operator >(@checked Index1D other) => x > other.x;

  /// Compares if this [Index1D] is less than [other]
  ///
  ///     final i1 = idx1D(5);
  ///     print(i1 < idx1D(2)); // => false
  ///     print(i1 < idx1D(10)); // => true
  bool operator <(@checked Index1D other) => x < other.x;

  /// Compares if this [Index1D] is greater than or equal [other]
  ///
  ///     final i1 = idx1D(5);
  ///     print(i1 >= idx1D(2)); // => true
  ///     print(i1 >= idx1D(10)); // => false
  ///     print(i1 >= idx1D(5)); // => true
  bool operator >=(@checked Index1D other) => x >= other.x;

  /// Compares if this [Index1D] is less than or equal [other]
  ///
  ///     final i1 = idx1D(5);
  ///     print(i1 <= idx1D(2)); // => false
  ///     print(i1 <= idx1D(10)); // => true
  ///     print(i1 <= idx1D(5)); // => true
  bool operator <=(@checked Index1D other) => x <= other.x;

  String toString() => 'Shape($x)';
}

/// A 2-dimensional index
///
///     final i2 = idx2D(5, 25);
///     print(i2.dim);  // => 2
///     print(i2.row);  // => 5
///     print(i2.col);  // => 25
class Index2D implements Index {
  /// Row this index is indexing
  ///
  ///     final i2 = idx2D(5, 25);
  ///     print(i2.row);  // => 5
  final int row;

  /// Column this index is indexing
  ///
  ///     final i2 = idx2D(5, 25);
  ///     print(i2.col);  // => 25
  final int col;

  /// Constructs a new 2D index with given [row] and [col]
  const Index2D(this.row, this.col);

  /// Number of dimensions of this [Index]
  ///
  ///     final i2 = idx2D(5, 25);
  ///     print(i2.dim);  // => 2
  int get dim => 2;

  /// Gets the index with the given dimension [d]
  ///
  ///     final i2 = idx2D(5, 25);
  ///     print(i2[0]);  // => 5
  ///     print(i2[1]);  // => 25
  int operator [](int d) {
    if (d >= dim)
      throw new RangeError.range(d, 0, dim - 1, 'd', 'Out of range!');
    if (d == 0) return row;
    return col;
  }

  /// Converts [Index] to [List] of [int] with two element
  ///
  ///     final i2 = idx2D(5, 25);
  ///     print(i2.toList()); // => [5, 25]
  List<int> toList() => <int>[row, col];

  /// Checks if two [Index2D] are equal
  ///
  ///     final i2 = idx2D(5, 25);
  ///     print(i2 == [5, 25]); // => true
  ///     print(i2 == [5, 24]); // => false
  bool operator ==(other) {
    if (other is Index2D) {
      return other.row == this.row && other.col == this.col;
    } else if (other is Iterable<int>) {
      if (other.length != 2) return false;
      if (other.elementAt(0) != row) return false;
      if (other.elementAt(1) != col) return false;
      return true;
    }

    return false;
  }

  /// Compares if this [Index2D] is greater than [other]
  ///
  ///     final i2 = idx2D(5, 25);
  ///     print(i2 > idx2D(0, 0)); // => true
  ///     print(i2 > idx2D(10, 20)); // => false
  bool operator >(@checked Index2D other) => row > other.row && col > other.col;

  /// Compares if this [Index2D] is less than [other]
  ///
  ///     final i2 = idx2D(5, 25);
  ///     print(i2 < idx2D(4, 30)); // => false
  ///     print(i2 < idx2D(10, 30)); // => true
  bool operator <(@checked Index2D other) => row < other.row && col < other.col;

  /// Compares if this [Index2D] is greater than or equal [other]
  ///
  ///     final i2 = idx2D(5, 25);
  ///     print(i2 >= idx2D(5, 5)); // => true
  ///     print(i2 >= idx2D(4, 30)); // => false
  ///     print(i2 >= idx2D(5, 25)); // => true
  bool operator >=(@checked Index2D other) =>
      row >= other.row && col >= other.col;

  /// Compares if this [Index2D] is less than or equal [other]
  ///
  ///     final i2 = idx2D(5, 25);
  ///     print(i2 <= idx2D(10, 20)); // => false
  ///     print(i2 <= idx2D(10, 30)); // => true
  ///     print(i2 <= idx2D(5, 25)); // => true
  bool operator <=(@checked Index2D other) =>
      row <= other.row && col <= other.col;

  /// Returns the transpose of the index
  Index2D get transpose => new Index2D(col, row);

  /// Creates a new 2D Index with given [col] and existing [row]
  Index2D withColumn(int col) => new Index2D(row, col);

  /// Creates a new 2D Index with given [row] and existing [col]
  Index2D withRow(int row) => new Index2D(row, col);

  /// Returns a 2D index with 0th row and 0th column
  static const Index2D zero = const Index2D(0, 0);

  String toString() => 'Shape(${row}x${col})';
}
