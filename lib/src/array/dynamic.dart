part of grizzly.primitives.array;

abstract class DynamicArray implements Array<dynamic>, DynamicArrayFix {}

abstract class DynamicArrayFix implements ArrayFix<dynamic>, DynamicArrayView {}

abstract class DynamicArrayView implements ArrayView<dynamic> {
  Comparator get comparator;

  Numeric1D<int> toIntArray(
      {int defaultValue, int Function(dynamic value) onInvalid});

  Numeric1D<double> toDoubleArray(
      {double defaultValue, double Function(dynamic value) onInvalid});

  BoolArrayView toBoolArray(
      {bool defaultValue, bool Function(dynamic value) onInvalid});

  @override
  StringArray toStringArray(
      {String defaultValue, String Function(dynamic value) onInvalid});
}
