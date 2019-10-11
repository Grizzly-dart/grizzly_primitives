part of grizzly.viz.scales.ranger;

class ConstantIterable<T> extends IterableBase<T> {
  final int length;

  final T constant;

  ConstantIterable(this.constant, [this.length = 10]);

  Iterator<T> get iterator => new ConstantIterator<T>(constant, length);

  bool get isEmpty => length == 0;

  int get hashCode {
    int result = 17;
    result = 37 * result + constant.hashCode;
    result = 37 * result + length.hashCode;
    return result;
  }

  String toString() => 'ConstantIterable($constant, $length)';

  bool operator ==(other) =>
      other is ConstantIterable &&
      constant == other.constant &&
      length == other.length;
}

class ConstantIterator<T> implements Iterator<T> {
  int _pos = -1;

  final int length;

  final T constant;

  ConstantIterator(this.constant, this.length);

  T get current => constant;

  bool moveNext() {
    _pos++;
    if (_pos < length) {
      return true;
    }

    return false;
  }
}
