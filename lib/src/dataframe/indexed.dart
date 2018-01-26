part of grizzly.primitives.dataframe;

class FrameByLabel<LT, CT> {
  final DataFrameBase<LT, CT> frame;

  FrameByLabel(this.frame);

  Series<CT, dynamic> operator [](LT index) => frame.getByLabel(index);

  operator []=(LT index, List value) => frame.setByLabel(index, value);

  Series<CT, dynamic> get(LT index) => frame.getByLabel(index);

  void set(LT index, List value) => frame.setByLabel(index, value);

  List<Series<CT, dynamic>> getMulti(LT index) => frame.getByLabelMulti(index);
}
