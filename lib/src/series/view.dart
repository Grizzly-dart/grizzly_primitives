part of grizzly.primitives.series;

abstract class SeriesView<LT, VT> {
  /// Name of the series
  dynamic get name;

  /// Labels of the series
  ArrayView<LT> get labels;

  /// Data of the series
  ArrayView<LT> get data;

  /// Length of the series
  int get length;

  /// Checks if Series contains the label
  bool containsIndex(LT label);

  /// Lookup value by [label]
  VT operator [](LT label);

  /// Lookup value by [label]
  VT get(LT label);

  /// Lookup by [position]
  VT getByPos(int position);

  SeriesViewByPosition<LT, VT> get byPos;

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
      {bool sortByValue: false, bool ascending: false, bool dropNull: false});

  SeriesView<LT, VT> get toView;

  Series<LT, VT> get toSeries;

  Series<LT, String> toStringSeries();

  DataFrameBase<LT, dynamic> toDataFrame<CT>({CT column});

  SeriesView<IIT, VT> makeView<IIT>(Iterable<VT> data,
      {dynamic name, List<IIT> labels});

  Series<IIT, VT> make<IIT>(Iterable<VT> data,
      {dynamic name, List<IIT> labels});

  bool labelsMatch(ArrayView<LT> labels);
}
