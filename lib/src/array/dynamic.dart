part of grizzly.primitives.array;

abstract class DynamicArray implements Array<dynamic>, DynamicArrayFix {}

abstract class DynamicArrayFix implements ArrayFix<dynamic>, DynamicArrayView {}

abstract class DynamicArrayView implements ArrayView<dynamic> {
  Comparator get comparator;

  Numeric1D<int> toIntArray({int defaultValue, int onInvalid(value)});

  Numeric1D<double> toDoubleArray(
      {double defaultValue, double onInvalid(value)});

  BoolArrayView toBoolArray({bool defaultValue, bool onInvalid(value)});

  StringArray toStringArray({String defaultValue, String onInvalid(value)});
}