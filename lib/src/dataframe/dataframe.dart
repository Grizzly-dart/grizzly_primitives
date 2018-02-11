library grizzly.primitives.dataframe;

import 'package:grizzly_primitives/src/core/core.dart';
import 'package:grizzly_primitives/src/series/series.dart';

part 'indexed.dart';
part 'positioned.dart';

abstract class DataFrameBase<LT, CT> {
  int get numCols;

  int get numRows;

  Index2D get shape;

  Iterable<CT> get columns;

  /// Labels
  Iterable<LT> get labels;

  SeriesFix<LT, dynamic> operator [](CT column);

  operator []=(CT column, /* SeriesView<LT, dynamic> | IterView */ value);

  SeriesFix<LT, VT> get<VT>(CT column);

  void set<VT>(CT column, /* SeriesView<LT, VT> | IterView<VT> */ value);

  DynamicSeriesViewBase<CT> getByPos(int position);

  void setByPos(int position, /* SeriesView<CT, dynamic> | IterView */ value);

  DynamicSeriesViewBase<CT> getByLabel(LT label);

  void setByLabel(LT label, /* SeriesView<CT, dynamic> | IterView */ value);

  Pair<LT, DynamicSeriesViewBase<CT>> pairByPos(int position);

  Pair<LT, DynamicSeriesViewBase<CT>> pairByLabel(LT label);

  Iterable<Pair<LT, DynamicSeriesViewBase<CT>>> get enumerate;

  Iterable<Pair<LT, DynamicSeriesViewBase<CT>>> enumerateSliced(int start,
      [int end]);

  /* TODO
  void addColumnFromList<VVT>(CT column, List<VVT> value,
      {SeriesMaker<LT, VVT> maker});

  Series<CT, dynamic> max({dynamic name, bool numericOnly: false});

  Series<CT, dynamic> min({dynamic name, bool numericOnly: false});

  DataFrameBase<int, CT> mode();
  */
}
