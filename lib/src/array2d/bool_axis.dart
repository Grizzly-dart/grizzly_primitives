part of grizzly.primitives.array2d;

abstract class BoolArray2DView implements Array2DView<bool> {
  @override
  BoolAxis2DView get row;

  @override
  BoolAxis2DView get col;

  @override
  BoolArrayView operator [](int i);
}

abstract class BoolAxis2DView implements Axis2DView<bool> {
  Numeric1D<double> get mean;

  Numeric1D<int> get sum;

  @override
  BoolArrayView operator [](int r);
}
