library grizzly.primitives.dataframe;

import 'package:grizzly_primitives/src/core/core.dart';
import 'package:grizzly_primitives/src/array2d/array2d.dart';
import 'package:grizzly_primitives/src/series/series.dart';

abstract class DataFrameBase<LT> implements Labeled<LT> {
  int get numCols;

  int get numRows;

  Index2D get shape;

  Iterable<String> get columns;

  @override

  /// Labels
  Iterable<LT> get labels;

  @override
  LT labelAt(int pos);

  @override
  int posOf(LT label);

  @override
  bool containsLabel(LT label);

  SeriesFix<LT, dynamic> operator [](String column);

  operator []=(
      String column, /* SeriesView<LT, dynamic> | IterView | Iterable */ value);

  SeriesFix<LT, VT> get<VT>(String column);

  void set<VT>(
      String column,
      /* SeriesView<LT, VT> | IterView<VT> | Iterable<VT>*/ value);

  DynamicSeriesViewBase<String> getByPos(int position);

  void setByPos(
      int position, /* SeriesView<String, dynamic> | IterView */ value);

  DynamicSeriesViewBase<String> getByLabel(LT label);

  void setByLabel(LT label, /* SeriesView<String, dynamic> | IterView */ value);

  void append(
      LT label,
      /* SeriesView<String, dynamic> | IterView | Map<String, dynamic> */ value);

  void insert(
      int pos,
      LT label,
      /* SeriesView<String, dynamic> | IterView | Map<String, dynamic> | DfCellSetter */ value);

  void appendColumn(String name, value);

  void insertColumn(int pos, String name, value);

  void setColumn(String name, value);

  void removeColumn(String name);

  bool containsColumn(String column);

  Pair<LT, DynamicSeriesViewBase<String>> pairByPos(int position);

  Pair<LT, DynamicSeriesViewBase<String>> pairByLabel(LT label);

  Iterable<Pair<LT, DynamicSeriesViewBase<String>>> get enumerate;

  Iterable<Pair<LT, DynamicSeriesViewBase<String>>> enumerateSliced(int start,
      [int end]);

  /// Remove element at position [pos]
  void removeByPos(int pos);

  void removeManyByPos(List<int> positions);

  void drop(LT label);

  void dropMany(/* Iterable<LT> | IterView<LT> | Labeled */ labels);

  void keep(mask);

  void keepOnly(Labeled<LT> mask);

  void keepLabels(Iterable<LT> mask);

  void keepIf(BoolSeriesViewBase<LT> mask);

  void keepWhen(DfCond<LT> cond);

  DataFrameBase<LT> select(mask);

  DataFrameBase<LT> selectOnly(Labeled<LT> mask);

  DataFrameBase<LT> selectLabels(Iterable<LT> mask);

  DataFrameBase<LT> selectIf(BoolSeriesViewBase<LT> mask);

  DataFrameBase<LT> selectWhen(DfCond<LT> cond);

  void setIf(
      BoolSeriesViewBase<LT> mask,
      /* SeriesView<String, dynamic> | IterView | Map<String, dynamic> | DfCellSetter */ value);

  void setWhen(
      DfCond<LT> cond,
      /* SeriesView<String, dynamic> | IterView | Map<String, dynamic> | DfCellSetter */ value);

  DataFrameBase<LT> filter(mask);

  DataFrameBase<LT> filterOnly(Labeled<String> mask);

  DataFrameBase<LT> filterNamed(Iterable<String> mask);

  DataFrameBase<LT> filterIf(BoolSeriesViewBase<String> mask);

  DataFrameBase<LT> filterWhen(DfCond cond);

  Numeric2D<double> toDouble2D(
      {bool skipInvalid = true,
      bool convert = true,
      bool retype = false,
      bool parse = false});

  Numeric2D<int> toInt2D(
      {bool skipInvalid = true,
      bool convert = true,
      bool retype = false,
      bool parse = false});

  /* TODO
  void addColumnFromList<VVT>(String column, List<VVT> value,
      {SeriesMaker<LT, VVT> maker});

  Series<String, dynamic> max({dynamic name, bool numericOnly = false});

  Series<String, dynamic> min({dynamic name, bool numericOnly = false});

  DataFrameBase<int, String> mode();
  */
}

typedef DfCond<LT> = bool Function(LT lav, DataFrameBase<LT> df);

typedef DfCellSetter<LT, VT> = VT Function(String col, LT label);
