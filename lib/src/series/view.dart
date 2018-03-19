part of grizzly.primitives.series;

abstract class SeriesView<LT, VT> {
  /// Name of the series
  String get name;

  /// Labels of the series
  Iterable<LT> get labels;

  /// Data of the series
  ArrayView<VT> get data;

  List<VT> toList();

  /// Length of the series
  int get length;

  /// Checks if Series contains the label
  bool containsLabel(LT label);

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

  Series<int, VT> mode();

  Series<VT, int> valueCounts(
      {bool sortByValue: false, bool descending: false, bool dropNull: false});

  SeriesView<LT, VT> get view;

  Series<LT, VT> toSeries();

  Series<LT, String> toStringSeries();

  DataFrameBase<LT> toDataFrame({String column});

  SeriesView<NLT, VT> makeView<NLT>(Iterable<VT> data,
      {dynamic name, Iterable<NLT> labels});

  Series<NLT, VT> make<NLT>(/* Iterable<VT> | ArrayView<VT> */ data,
      {dynamic name, Iterable<NLT> labels});

  Array<VT> makeValueArray(Iterable<VT> data);

  Array<VT> makeValueArraySized(int size);

  bool labelsMatch(
      /* IterView<LT> | Series<LT, dynamic> | Iterable<LT> */ labels);

  int compareVT(VT a, VT b);

  BoolSeriesBase<LT> operator <(
      /* E | IterView<E> | NumericSeriesView<E> | Numeric1DView<E> */ other);

  BoolSeriesBase<LT> operator <=(
      /* E | IterView<E> | NumericSeriesView<E> | Numeric1DView<E> */ other);

  BoolSeriesBase<LT> operator >(
      /* E | IterView<E> | NumericSeriesView<E> | Numeric1DView<E> */ other);

  BoolSeriesBase<LT> operator >=(
      /* E | IterView<E> | NumericSeriesView<E> | Numeric1DView<E> */ other);

  BoolSeriesBase<LT> isEqual(
      /* E | IterView<E> | NumericSeriesView<E> | Numeric1DView<E> */ other);

  BoolSeriesBase<LT> isNotEqual(
      /* E | IterView<E> | NumericSeriesView<E> | Numeric1DView<E> */ other);


}
