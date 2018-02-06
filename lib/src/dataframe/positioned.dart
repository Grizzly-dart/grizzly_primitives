part of grizzly.primitives.dataframe;

class FrameByPosition<LT, CT> {
  final DataFrameBase<LT, CT> frame;

  FrameByPosition(this.frame);

  Series<CT, dynamic> operator [](int position) => frame.getByPos(position);

  operator []=(int position, List value) => frame.setByPos(position, value);

  Series<CT, dynamic> get(int position) => frame.getByPos(position);

  void set(int position, List value) => frame.setByPos(position, value);
}
