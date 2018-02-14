part of grizzly.primitives.array2d;

abstract class BoolArray2DView implements Array2DView<bool> {
  BoolAxis2DView get row;

  BoolAxis2DView get col;

  BoolArrayView operator [](int i);
}

abstract class BoolAxis2DView implements Axis2DView<bool> {
  Numeric1D<double> get mean;

  Numeric1D<int> get sum;

  BoolArrayView operator [](int r);
}
