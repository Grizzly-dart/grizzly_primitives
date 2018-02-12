library grizzly.primitives.series;

import 'package:grizzly_primitives/src/core/core.dart';
import 'package:grizzly_primitives/src/iter/iter.dart';
import 'package:grizzly_primitives/src/array/array.dart';
import 'package:grizzly_primitives/src/dataframe/dataframe.dart';

part 'dynamic.dart';
part 'bool.dart';
part 'string.dart';
part 'positioned.dart';
part 'numeric.dart';
part 'view.dart';

typedef Series<LT, VT> SeriesMaker<LT, VT>(Iterable<VT> data,
    {dynamic name, Iterable<LT> labels});

/// A series with index of type [LT] and value of type [VT]
abstract class Series<LT, VT> implements SeriesFix<LT, VT> {
  void append(LT label, VT value);

  /// Remove element at position [position]
  void remove(int position);

  /// Remove multiple element at positions [positions]
  void removeMany(List<int> positions);

  /// Drop elements by label [label]
  void drop(LT label);

  /// Drop elements by label [label]
  void dropMany(List<LT> label);

  void assign(/* Series<LT, VT> | IterView<VT> */ other, {bool addNew: true});

  void assignMap(Map<LT, VT> other, {bool addNew: true});

  void sortByValue({bool descending: false});

  void sortByLabel({bool descending: false});

  void mask(IterView<bool> mask);
}

/// A series with index of type [LT] and value of type [VT]
abstract class SeriesFix<LT, VT> implements SeriesView<LT, VT> {
  /// Sets [value] by [label]
  operator []=(LT label, VT value);

  /// Sets [value] by [label]
  void set(LT label, VT value);

  /// Sets [value] by [position]
  void setByPos(int position, VT value);

  void apply(VT func(VT value));

  void assign(/* Series<LT, VT> | IterView<VT> */ other);

  void assignMap(Map<LT, VT> other);

  SeriesFix<LT, VT> get fixed;
}
