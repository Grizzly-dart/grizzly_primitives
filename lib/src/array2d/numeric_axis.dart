part of grizzly.primitives.array2d;

abstract class Numeric2DAxis<E extends num>
    implements Axis2D<E>, Numeric2DAxisFix<E> {
  Numeric1DFix<E> operator [](int r);
}

abstract class Numeric2DAxisFix<E extends num>
    implements Axis2DFix<E>, Numeric2DAxisView<E> {
  Numeric1DFix<E> operator [](int r);
}

abstract class Numeric2DAxisView<E extends num> implements Axis2DView<E> {
  Numeric1DView<E> operator [](int r);

  Array<double> get mean;

  Array<E> get sum;

  Array<double> average(Iterable<num> weights);

  Array<double> get variance;

  Array<double> get std;

  Numeric2D<E> operator +(Numeric1DView<E> other);

  Numeric2D<E> operator -(Numeric1DView<E> other);

  Numeric2D<E> operator *(Numeric1DView<E> other);

  Numeric2D<double> operator /(Numeric1DView other);

  Numeric2D<int> operator ~/(Numeric1DView other);
}
