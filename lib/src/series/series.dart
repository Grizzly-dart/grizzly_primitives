library grizzly.primitives.series;

import 'dart:collection';
import 'package:grizzly_primitives/src/core/core.dart';
import 'package:grizzly_primitives/src/dataframe/dataframe.dart';
import 'package:grizzly_primitives/src/array/array.dart';

part 'positioned.dart';
part 'view.dart';

typedef Series<LT, VT> SeriesMaker<LT, VT>(Iterable<VT> data,
    {dynamic name, Iterable<LT> labels});

/// A series with index of type [LT] and value of type [VT]
abstract class Series<LT, VT> {
  /// Name of the series
  dynamic name;

  /// Labels of the series
  UnmodifiableListView<LT> get labels;

  /// Data of the series
  UnmodifiableListView<VT> get data;

  /// Length of the series
  int get length;

  /// Checks if Series contains the label
  bool containsIndex(LT label);

  /// Lookup value by [label]
  VT operator [](LT label);

  /// Sets [value] by [label]
  operator []=(LT label, VT value);

  /// Lookup value by [label]
  VT get(LT label);

  /// Sets [value] by [label]
  void set(LT label, VT value);

  /// Lookup by [position]
  VT getByPos(int position);

  /// Sets [value] by [position]
  void setByPos(int position, VT value);

  SeriesByPosition<LT, VT> get byPos;

  /// Returns label at [position]
  LT labelAt(int position);

  /// Returns pair by [label]
  Pair<LT, VT> pairByLabel(LT label);

  /// Returns pair by [position]
  Pair<LT, VT> pairByPos(int position);

  Iterable<Pair<LT, VT>> get enumerate;

  Iterable<Pair<LT, VT>> enumerateSliced(int start, [int end]);

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

  VT get max;

  VT get min;

  Series<int, VT> mode();

  Series<VT, int> valueCounts(
      {bool sortByValue: false, bool ascending: false, bool dropNull: false});

  Array<VT> unique();

  Series<LT, VT> uniqueSeries();

  Array<IntPair<VT>> uniqueIndexPair();

  Array<int> uniqueIndices();

  void mask(Array<bool> mask);

  Series<LT, VT> sortByValue({bool ascending: true});

  Series<LT, VT> sortByIndex({bool ascending: true});

  Series<IIT, VT> makeNew<IIT>(Iterable<VT> data,
      {dynamic name, List<IIT> labels});

  SeriesView<LT, VT> get toView;

  DataFrameBase<LT, dynamic> toDataFrame<CT>({CT column});

  Series<LT, String> toStringSeries();
}
