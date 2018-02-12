part of grizzly.primitives.array2d;

abstract class DynamicAxis2DView implements Axis2DView<dynamic> {}

abstract class DynamicArray2D implements DynamicArray2DFix, Array2D<dynamic> {}

abstract class DynamicArray2DFix
    implements DynamicArray2DView, Array2DFix<dynamic> {}

abstract class DynamicArray2DView implements Array2DView<dynamic> {}
