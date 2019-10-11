part of grizzly.primitives.series;

abstract class SeriesView<LT, VT> implements Labeled<LT> {
  /// Name of the series
  String get name;

  /// Labels of the series
  Iterable<LT> get labels;

  /// Data of the series
  ArrayView<VT> get data;

  /// Length of the series
  int get length;

  /// Lookup value by [label]
  VT operator [](LT label);

  /// Lookup value by [label]
  VT get(LT label);

  /// Lookup by [position]
  VT getByPos(int position);

  /// Returns label at [position]
  LT labelAt(int position);

  int posOf(LT label);

  /// Returns pair by [label]
  Pair<LT, VT> pairByLabel(LT label);

  /// Returns pair by [position]
  Pair<LT, VT> pairByPos(int position);

  Iterable<Pair<LT, VT>> get enumerate;

  Iterable<Pair<LT, VT>> enumerateSliced(int start, [int end]);

  List<VT> toList();

  Series<int, VT> mode();

  Series<VT, int> valueCounts(
      {bool sortByValue: false, bool descending: false, bool dropNull: false});

  SeriesView<LT, VT> get view;

  Series<LT, VT> toSeries();

  Series<LT, String> toStringSeries();

  DataFrameBase<LT> toDataFrame({String column});

  SeriesView<NLT, VT> makeView<NLT>(Iterable<VT> data,
      {dynamic name, Iterable<NLT> labels});

  Series<NLT, VT> make<NLT>(Iterable<VT> data,
      {dynamic name, Iterable<NLT> labels});

  Array<VT> makeValueArray(Iterable<VT> data);

  Array<VT> makeValueArraySized(int size);

  int compareValue(VT a, VT b);

  BoolSeriesBase<LT> operator <(
      /* E | Iterable<E> | SeriesView<E> */ other);

  BoolSeriesBase<LT> operator <=(
      /* E | Iterable<E> | SeriesView<E> */ other);

  BoolSeriesBase<LT> operator >(
      /* E | Iterable<E> | SeriesView<E> */ other);

  BoolSeriesBase<LT> operator >=(
      /* E | Iterable<E> | SeriesView<E> */ other);

  BoolSeriesBase<LT> eq(
      /* E | Iterable<E> | SeriesView<E> */ other);

  BoolSeriesBase<LT> ne(
      /* E | Iterable<E> | SeriesView<E> */ other);

  BoolSeriesBase<LT> boolean(SeriesCond<LT, VT> cond);

  Iterable<LT> labelsWhere(SeriesCond<LT, VT> cond);

  Series<LT, VT> select(mask);

  Series<LT, VT> selectOnly(Labeled<LT> mask);

  Series<LT, VT> selectLabels(Iterable<LT> mask);

  Series<LT, VT> selectIf(BoolSeriesViewBase<LT> mask);

  Series<LT, VT> selectWhen(SeriesCond<LT, VT> cond);

  NumericSeriesView<LT, int> get asInt;

  NumericSeriesView<LT, double> get asDouble;

  BoolSeriesViewBase<LT> get asBool;

  StringSeriesViewBase<LT> get asString;

  DynamicSeriesViewBase<LT> get asDynamic;
}
