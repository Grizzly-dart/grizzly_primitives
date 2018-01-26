library grizzly.primitives.dataframe;

import 'dart:collection';
import 'package:grizzly_primitives/src/core/core.dart';
import 'package:grizzly_primitives/src/series/series.dart';

part 'indexed.dart';
part 'positioned.dart';

abstract class DataFrameBase<LT, CT> {
  FrameByPosition get byPos;

  FrameByLabel get byLabel;

  UnmodifiableListView<CT> get columns;

  UnmodifiableListView<LT> get labels;

  SeriesView<LT, dynamic> operator [](CT column);

  operator []=(CT column, Series<LT, dynamic> value);

  Series<CT, dynamic> getByPos(int position);

  void setByPos(int position, List value);

  Series<CT, dynamic> getByLabel(LT label);

  List<Series<CT, dynamic>> getByLabelMulti(LT label);

  void setByLabel(LT index, List value);

  Pair<LT, Series<CT, dynamic>> pairByLabel(LT label);

  Pair<LT, Series<CT, dynamic>> pairByPos(int position);

  Iterable<Pair<LT, Series<CT, dynamic>>> enumerate();

  Iterable<Pair<LT, Series<CT, dynamic>>> enumerateSliced(int start, [int end]);

  void addColumnFromList<VVT>(CT column, List<VVT> value,
      {SeriesMaker<LT, VVT> maker});

  Series<CT, dynamic> max({dynamic name, bool numericOnly: false});

  Series<CT, dynamic> min({dynamic name, bool numericOnly: false});

  DataFrameBase<int, CT> mode();

  List<int> get shape;

  int get length;
}
