library grizzly.primitives.series;

import 'package:grizzly_primitives/src/core/core.dart';
import 'package:grizzly_primitives/src/dataframe/dataframe.dart';
import 'package:grizzly_primitives/src/array/array.dart';

part 'positioned.dart';
part 'numeric.dart';
part 'view.dart';

typedef Series<LT, VT> SeriesMaker<LT, VT>(Iterable<VT> data,
    {dynamic name, Iterable<LT> labels});

/// A series with index of type [LT] and value of type [VT]
abstract class Series<LT, VT> implements SeriesView<LT, VT> {
  /// Sets [value] by [label]
  operator []=(LT label, VT value);

  /// Sets [value] by [label]
  void set(LT label, VT value);

  /// Sets [value] by [position]
  void setByPos(int position, VT value);

  SeriesByPosition<LT, VT> get byPos;

  void append(LT label, VT value);

  /// Remove element at position [position]
  void remove(int position);

  /// Remove multiple element at positions [positions]
  void removeMany(List<int> positions);

  /// Drop elements by label [label]
  void drop(LT label);

  /// Drop elements by label [label]
  void dropMany(List<LT> label);

  void apply(VT func(VT value));

  void assign(Series<LT, VT> other);

  Series<LT, VT> sortByValue({bool ascending: true});

  Series<LT, VT> sortByIndex({bool ascending: true});

  Series<LT, VT> uniqueSeries();

  Array<IntPair<VT>> uniqueIndexPair();

  Array<int> uniqueIndices();

  void mask(Array<bool> mask);
}
