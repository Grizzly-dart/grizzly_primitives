part of grizzly.viz.scales.ranger;

//Copyright (c) 2011 Olov Lassus <olov.lassus@gmail.com>
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in
//all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//THE SOFTWARE.

// Copyright (c) 2011 Ravi Teja Gudapati <tejainece@gmail.com>

class IntRangeIterable extends IterableBase<int> {
  /// Starting value of the range
  final int start;

  /// End value of the sequence
  final int stop;

  /// Spacing between values
  final int step;

  IntRangeIterable._(this.start, this.stop, this.step);

  /// Create a range [0, stop) with [step]
  factory IntRangeIterable.until(int stop, [int step = 1]) {
    if (step == 0) throw new ArgumentError.value(step, 'step', 'Must not be 0');
    return new IntRangeIterable._(0, stop, step);
  }

  factory IntRangeIterable(int start, int stop, [int step = 1]) {
    if (step == 0) throw new ArgumentError.value(step, 'step', 'Must not be 0');
    return new IntRangeIterable._(start, stop, step);
  }

  factory IntRangeIterable.linspace(int start, int stop, [int count = 50]) {
    if (count == 0)
      throw new ArgumentError.value(count, 'count', 'Must not be 0');

    int step = (stop - start) ~/ (count - 1);

    if (step == 0) step = 1;

    return new IntRangeIterable._(start, stop, step);
  }

  Iterator<int> get iterator => new IntRangeIterator(start, stop, step);

  int get length {
    if ((step > 0 && start > stop) || (step < 0 && start < stop)) {
      return 0;
    }
    return ((stop - start) / step).ceil();
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
      other is IntRangeIterable &&
      start == other.start &&
      stop == other.stop &&
      step == other.step;
}

class IntRangeIterator implements Iterator<int> {
  int _pos;
  final int _stop;
  final int _step;

  IntRangeIterator(int pos, int stop, int step)
      : _stop = stop,
        _pos = pos - step,
        _step = step;

  int get current => _pos;

  bool moveNext() {
    if (_step > 0) {
      if (_pos >= _stop) return false;
    } else {
      if (_pos <= _stop) return false;
    }

    _pos += _step;
    return true;
  }
}
