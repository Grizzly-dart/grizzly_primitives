part of grizzly.primitives.array;

abstract class StringArray implements Array<String> {
  Array<bool> get isAlphaNum;

  Array<bool> get isAlphabet;

  Array<bool> get isDecimal;

  Array<bool> get isNumber;

  Array<bool> get isLower;

  Array<bool> get isSpace;

  Array<bool> get isUpper;

  Array<bool> startsWith();

  String join(String delimiter);

  void lshift(int width, [String fillchar = ' ']);

  void rshift(int width, [String fillchar = ' ']);

  void lower();

  void upper();

  void lstrip();

  void rstrip();

// TODO split
}