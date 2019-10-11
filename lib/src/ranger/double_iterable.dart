part of grizzly.viz.scales.ranger;

class DoubleRangeIterable extends IterableBase<double> {
  /// Starting value of the range
  final double start;

  /// End value of the sequence
  final double stop;

  /// Spacing between values
  final double step;

  DoubleRangeIterable._(this.start, this.stop, this.step);

  /// Create a range [0, stop] with [step]
  factory DoubleRangeIterable.until(double stop, [double step = 1.0]) {
    if (step == 0.0)
      throw new ArgumentError.value(step, 'step', 'Must not be 0');
    return new DoubleRangeIterable._(0.0, stop, step);
  }

  factory DoubleRangeIterable(double start, double stop, [double step = 1.0]) {
    if (step == 0.0)
      throw new ArgumentError.value(step, 'step', 'Must not be 0');
    return new DoubleRangeIterable._(start, stop, step);
  }

  factory DoubleRangeIterable.linspace(double start, double stop,
      [int count = 50]) {
    if (count == 0)
      throw new ArgumentError.value(count, 'count', 'Must not be 0');

    final double step = (stop - start) / (count - 1);

    if (step == 0.0)
      throw new ArgumentError.value(step, 'step', 'Must not be 0');

    return new DoubleRangeIterable._(start, stop, step);
  }

  Iterator<double> get iterator => new DoubleRangeIterator(start, stop, step);

  int get length {
    if ((step > 0 && start > stop) || (step < 0 && start < stop)) return 0;
    return ((stop - start) / step).ceil() + 1;
  }

  bool get isEmpty => length == 0;

  int get hashCode {
    int result = 17;
    result = 37 * result + start.hashCode;
    result = 37 * result + stop.hashCode;
    result = 37 * result + step.hashCode;
    return result;
  }

  String toString() =>
      step == 1 ? "Range($start, $stop)" : "Range($start, $stop, $step)";

  bool operator ==(other) =>
      other is DoubleRangeIterable &&
      start == other.start &&
      stop == other.stop &&
      step == other.step;
}

class DoubleRangeIterator implements Iterator<double> {
  double _pos;
  final double _stop;
  final double _step;

  DoubleRangeIterator(double pos, double stop, double step)
      : _stop = stop,
        _pos = pos - step,
        _step = step;

  double get current => _pos;

  bool moveNext() {
    if (_step > 0) {
      if (_pos >= (_stop - 1e-12)) {
        return false;
      }
    } else {
      if (_pos <= (_stop + 1e-12)) {
        return false;
      }
    }

    _pos += _step;
    return true;
  }
}
