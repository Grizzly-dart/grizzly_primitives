part of grizzly.primitives.array;

abstract class StringArray implements StringArrayFix, Array<String> {}

abstract class StringArrayFix implements ArrayFix<String>, StringArrayView {
  void toLowerCase();

  void toUpperCase();

  void trim();

  void trimLeft();

  void trimRight();
}

abstract class StringArrayView implements ArrayView<String> {
  Array<bool> get isAlphaNum;

  Array<bool> get isAlphabet;

  Array<bool> get isDecimal;

  Array<bool> get isNumber;

  Array<bool> get isLower;

  Array<bool> get isUpper;

  Array<bool> get isSpace;

  Array<bool> startsWith(Pattern pattern, [int index = 0]);

  Array<bool> endsWith(String pattern);

  @override
  String join([String separator = '']);

  Array<int> get lengths;

  Array<bool> get areEmpty;

  Array<bool> get areNotEmpty;

  bool get areAllEmpty;

  bool get areAllNotEmpty;

  // TODO split

  Numeric1D<int> toInt(
      {int radix, int defaultValue, int Function(String source) onError});

  Numeric1D<double> toDouble(
      {double Function(String source) onError, double defaultValue});
}
