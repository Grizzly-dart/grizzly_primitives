part of grizzly.primitives.array2d;

abstract class Numeric2D<E extends num> implements Array2D<E>, Numeric2DFix<E> {
  Numeric2DAxis<E> get row;

  Numeric2DAxis<E> get col;

  Array2D<E> operator *(/* int | Iterable<int> | Numeric2DArray */ other);

  Array<E> firstWhere(bool test(Array<E> element), {Array<E> orElse()});

  Array<E> lastWhere(bool test(Array<E> element), {Array<E> orElse()});

  Array<E> reduce(Array<E> combine(ArrayView<E> value, ArrayView<E> element));
}

abstract class Numeric2DFix<E extends num>
    implements Array2DFix<E>, Numeric2DView<E> {
  Numeric2DAxisFix<E> get row;

  Numeric2DAxisFix<E> get col;

  void clip({E min, E max});

  ArrayFix<E> firstWhere(bool test(ArrayFix<E> element),
      {ArrayFix<E> orElse()});

  ArrayFix<E> lastWhere(bool test(ArrayFix<E> element), {ArrayFix<E> orElse()});

  ArrayFix<E> reduce(
      ArrayFix<E> combine(ArrayView<E> value, ArrayView<E> element));
}

abstract class Numeric2DView<E extends num> implements Array2DView<E> {
  Numeric2DAxisView<E> get row;

  Numeric2DAxisView<E> get col;

  // TODO E get ptp;

  Extent<E> get extent;

  double get mean;

  E get sum;

  double average(Iterable<Iterable<num>> weights);

  double get variance;

  double get std;

  Numeric2DView<E> operator -();

  Array2D<double> get toDouble;

  Array2D<double> get covMatrix;

  Array2D<double> get corrcoefMatrix;

  Numeric1D<E> dot(Iterable<num> other);

  Array2D<double> get log;

  Array2D<double> get log10;

  Array2D<double> logN(double n);

  Array2D<double> get exp;
}

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
}
