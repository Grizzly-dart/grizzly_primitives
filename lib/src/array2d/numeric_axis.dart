part of grizzly.primitives.array2d;

abstract class Numeric2DAxis<E extends num>
    implements Axis2D<E>, Numeric2DAxisFix<E> {
  @override
  Numeric1DFix<E> operator [](int r);
}

abstract class Numeric2DAxisFix<E extends num>
    implements Axis2DFix<E>, Numeric2DAxisView<E> {
  Numeric1DFix<E> operator [](int r);
}

abstract class Numeric2DAxisView<E extends num> implements Axis2DView<E> {
  @override
  Numeric1DView<E> operator [](int r);

  Numeric1D<double> get mean;

  Numeric1D<E> get sum;

  Numeric1D<double> average(Iterable<num> weights);

  Numeric1D<double> get variance;

  Numeric1D<double> get std;

  Numeric2D<E> operator +(
      /* num | Iterable<num> | Numeric2D<int> */ other);

  Numeric2D<E> operator -(
      /* num | Iterable<num> | Numeric2D<int> */ other);

  Numeric2D<E> operator *(
      /* num | Iterable<num> | Numeric2D<int> */ other);

  Numeric2D<double> operator /(
      /* num | Iterable<num> | Numeric2D<int> */ other);

  Numeric2D<int> operator ~/(
      /* num | Iterable<num> | Numeric2D<int> */ other);
}
