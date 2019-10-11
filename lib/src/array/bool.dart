part of grizzly.primitives.array;

abstract class BoolArray implements Array<bool>, BoolArrayFix {}

abstract class BoolArrayFix implements Array<bool>, BoolArrayView {}

abstract class BoolArrayView implements ArrayView<bool> {
  bool get isTrue;

  bool get isFalse;

  double get mean;

  int get sum;

  BoolArrayView operator &(Array<bool> other);

  BoolArrayView operator |(Array<bool> other);

  BoolArrayView operator ~();

  Numeric1D<int> toIntArray({int trueVal: 1, int falseVal: 0});

  StringArray toStringArray({String trueVal: 'True', String falseVal: 'False'});

  @override
  BoolArray clone({String name});

// TODO ArrayView<dynamic> toDynamic({trueVal: 1, falseVal: 0});
}
