library grizzly.primitives.series;

import 'dart:collection';
import 'package:grizzly_primitives/src/core/core.dart';
import 'package:grizzly_primitives/src/dataframe/dataframe.dart';

part 'positioned.dart';
part 'view.dart';

typedef Series<IT, VT> SeriesMaker<IT, VT>(Iterable<VT> data,
    {dynamic name, Iterable<IT> labels});

/// A series with index of type [IT] and value of type [VT]
abstract class Series<IT, VT> {
  /// Name of the series
  dynamic name;

  /// Labels of the series
  UnmodifiableListView<IT> get labels;

  /// Data of the series
  UnmodifiableListView<VT> get data;

  /// Length of the series
  int get length;

  /// Checks if Series contains the label
  bool containsIndex(IT label);

  /// Lookup value by [label]
  VT operator [](IT label);

  /// Sets [value] by [label]
  operator []=(IT label, VT value);

  /// Lookup value by [label]
  VT get(IT label);

  /// Sets [value] by [label]
  void set(IT label, VT value);

  /// Lookup by [position]
  VT getByPos(int position);

  /// Sets [value] by [position]
  void setByPos(int position, VT value);

  SeriesByPosition<IT, VT> get byPos;

  /// Returns label at [position]
  IT labelAt(int position);

  /// Returns pair by [label]
  Pair<IT, VT> pairByLabel(IT label);

  /// Returns pair by [position]
  Pair<IT, VT> pairByPos(int position);

  Iterable<Pair<IT, VT>> get enumerate;

  Iterable<Pair<IT, VT>> enumerateSliced(int start, [int end]);

  void append(IT label, VT value);

  /// Remove element at position [position]
  void remove(int position);

  /// Remove multiple element at positions [positions]
  void removeMany(List<int> positions);

  /// Drop elements by label [label]
  void drop(IT label);

  /// Drop elements by label [label]
  void dropMany(List<IT> label);

  void apply(VT func(VT value));

  void assign(Series<IT, VT> other);

  VT get max;

  VT get min;

  Series<int, VT> mode();

  Series<VT, int> valueCounts(
      {bool sortByValue: false, bool ascending: false, bool dropNull: false});

  Series<IT, VT> sortByValue({bool ascending: true});

  Series<IT, VT> sortByIndex({bool ascending: true});

  Series<IIT, VT> makeNew<IIT>(Iterable<VT> data,
      {dynamic name, List<IIT> labels});

  SeriesView<IT, VT> get toView;

  DataFrameBase<IT, dynamic> toDataFrame<CT>({CT column});

  Series<IT, String> toStringSeries();
}
