library grizzly.primitives.dataframe;

import 'package:grizzly_primitives/src/core/core.dart';
import 'package:grizzly_primitives/src/series/series.dart';

part 'indexed.dart';
part 'positioned.dart';

abstract class DataFrameBase<LT> {
  int get numCols;

  int get numRows;

  Index2D get shape;

  Iterable<String> get columns;

  /// Labels
  Iterable<LT> get labels;

  LT labelAt(int pos);

  SeriesFix<LT, dynamic> operator [](String column);

  operator []=(String column, /* SeriesView<LT, dynamic> | IterView */ value);

  SeriesFix<LT, VT> get<VT>(String column);

  void set<VT>(String column, /* SeriesView<LT, VT> | IterView<VT> */ value);

  DynamicSeriesViewBase<String> getByPos(int position);

  void setByPos(
      int position, /* SeriesView<String, dynamic> | IterView */ value);

  DynamicSeriesViewBase<String> getByLabel(LT label);

  void setByLabel(LT label, /* SeriesView<String, dynamic> | IterView */ value);

  Pair<LT, DynamicSeriesViewBase<String>> pairByPos(int position);

  Pair<LT, DynamicSeriesViewBase<String>> pairByLabel(LT label);

  Iterable<Pair<LT, DynamicSeriesViewBase<String>>> get enumerate;

  Iterable<Pair<LT, DynamicSeriesViewBase<String>>> enumerateSliced(int start,
      [int end]);

  /* TODO
  void addColumnFromList<VVT>(String column, List<VVT> value,
      {SeriesMaker<LT, VVT> maker});

  Series<String, dynamic> max({dynamic name, bool numericOnly: false});

  Series<String, dynamic> min({dynamic name, bool numericOnly: false});

  DataFrameBase<int, String> mode();
  */
}
