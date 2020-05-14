library grizzly.primitives.series;

import 'package:grizzly_primitives/src/core/core.dart';
import 'package:grizzly_primitives/src/array/array.dart';
import 'package:grizzly_primitives/src/dataframe/dataframe.dart';

part 'dynamic.dart';
part 'bool.dart';
part 'string.dart';
part 'positioned.dart';
part 'numeric.dart';
part 'view.dart';

typedef SeriesMaker<LT, VT> = Series<LT, VT> Function(Iterable<VT> data,
    {dynamic name, Iterable<LT> labels});

/// A series with index of type [LT] and value of type [VT]
abstract class Series<LT, VT> implements SeriesFix<LT, VT> {
  /// Name of the series
  // TODO String name;

  @override

  /// Data of the series
  ArrayFix<VT> get data;

  void append(LT label, VT value);

  void insert(int pos, LT label, VT value);

  /// Remove element at position [position]
  void remove(int position);

  /// Remove multiple element at positions [positions]
  void removeMany(List<int> positions);

  /// Drop elements by label [label]
  void drop(LT label);

  /// Drop elements by label [label]
  void dropMany(/* Iterable<LT> | IterView<LT> | Labeled */ label);

  @override
  void assign(/* Series<LT, VT> | IterView<VT> */ other, {bool addNew = true});

  @override
  void assignMap(Map<LT, VT> other, {bool addNew = true});

  void sortByValue({bool descending = false});

  void sortByLabel({bool descending = false});

  void keep(mask);

  void keepOnly(Labeled<LT> mask);

  void keepLabels(Iterable<LT> mask);

  void keepIf(BoolSeriesViewBase<LT> mask);

  void keepWhen(SeriesCond<LT, VT> cond);

  // TODO addColumn

  // TODO removeColumn

  @override
  NumericSeries<LT, int> get asInt;

  @override
  NumericSeries<LT, double> get asDouble;

  @override
  BoolSeriesBase<LT> get asBool;

  @override
  StringSeriesBase<LT> get asString;

  @override
  DynamicSeriesBase<LT> get asDynamic;
}

/// A series with index of type [LT] and value of type [VT]
abstract class SeriesFix<LT, VT> implements SeriesView<LT, VT> {
  @override

  /// Data of the series
  ArrayFix<VT> get data;

  /// Sets [value] by [label]
  operator []=(LT label, VT value);

  /// Sets [value] by [label]
  void set(LT label, VT value);

  /// Sets [value] by [position]
  void setByPos(int position, VT value);

  void apply(VT Function(VT value) func);

  void assign(/* Series<LT, VT> | IterView<VT> */ other);

  void assignMap(Map<LT, VT> other);

  SeriesFix<LT, VT> get fixed;

  @override
  NumericSeriesFix<LT, int> get asInt;

  @override
  NumericSeriesFix<LT, double> get asDouble;

  @override
  BoolSeriesFixBase<LT> get asBool;

  @override
  StringSeriesFixBase<LT> get asString;

  @override
  DynamicSeriesFixBase<LT> get asDynamic;
}

typedef SeriesCond<LT, VT> = bool Function(LT lab, SeriesView<LT, VT> s);
