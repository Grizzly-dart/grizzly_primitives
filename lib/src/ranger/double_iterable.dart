part of grizzly.viz.scales.ranger;

class DoubleRange extends IterableBase<double> {
  /// Starting value of the range
  final double start;

  /// End value of the sequence
  final double stop;

  /// Spacing between values
  final double step;

  DoubleRange._(this.start, this.stop, this.step);

  factory DoubleRange(double start, double stop, [double step]) {
    if (step == null)
      step = 1;
    else {
      if (step <= 0)
        throw ArgumentError.value(step, 'step', 'Must be greater than 0');
    }
    if (stop < start) step = -step;
    return DoubleRange._(start, stop, step);
  }

  /// Create a range [0, stop] with [step]
  factory DoubleRange.until(double stop, [double step = 1.0]) {
    if (step == null)
      step = 1;
    else {
      if (step <= 0)
        throw ArgumentError.value(step, 'step', 'Must be greater than 0');
    }
    if (stop < 0) step = -step;
    return DoubleRange._(0.0, stop, step);
  }

  factory DoubleRange.linspace(double start, double stop, [int count = 50]) {
    if (count <= 0)
      throw ArgumentError.value(count, 'count', 'Must be a positive integer');

    double step = 0;
    if (stop > start)
      step = (stop - start + 1) / count;
    else
      step = (start - stop + 1) / count;

    if (step == 0) step = 1;
    if (stop < step) step = -step;

    return DoubleRange._(start, stop, step);
  }

  Iterator<double> get iterator => DoubleRangeIterator(start, stop, step);

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

  bool operator ==(other) =>
      other is DoubleRange &&
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
      if (_pos + _step > (_stop - 1e-12)) return false;
    } else {
      if (_pos + _step < (_stop + 1e-12)) return false;
    }

    _pos += _step;
    return true;
  }
}
