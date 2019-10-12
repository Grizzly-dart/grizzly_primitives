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

/// Iterable of integers similar to python's range.
///
///     for(final i in IntRange(0, 5)) print(i);
class IntRange extends IterableBase<int> {
  /// Starting value of the range
  final int start;

  /// End value of the sequence
  final int stop;

  /// Spacing between values
  final int step;

  IntRange._(this.start, this.stop, this.step);

  /// Returns an iterable of integers from [start] inclusive to [stop] inclusive
  /// with [step].
  ///
  ///     print(IntRange(0, 5)); => (0, 1, 2, 3, 4, 5)
  factory IntRange(int start, int stop, [int step]) {
    if (step == null)
      step = 1;
    else {
      if (step <= 0)
        throw ArgumentError.value(step, 'step', 'Must be greater than 0');
    }
    if (stop < start) step = -step;
    return IntRange._(start, stop, step);
  }

  /// Returns an iterable of integers from 0 inclusive to [stop] inclusive with
  /// [step].
  ///
  ///     print(IntRange.until(5, 2)); => (0, 2, 4)
  factory IntRange.until(int stop, [int step]) {
    if (step == null)
      step = 1;
    else {
      if (step <= 0)
        throw ArgumentError.value(step, 'step', 'Must be greater than 0');
    }
    if (stop < 0) step = -step;
    return IntRange._(0, stop, step);
  }

  /// Returns an iterable of [count] integers from [start] inclusive to [stop]
  /// inclusive.
  ///
  ///     print(IntRange.linspace(1, 10, 5)); => (1, 3, 5, 7, 9)
  factory IntRange.linspace(int start, int stop, int count) {
    if (count <= 0)
      throw ArgumentError.value(count, 'count', 'Must be a positive integer');

    int step = 0;
    if (stop > start)
      step = (stop - start + 1) ~/ count;
    else
      step = (start - stop + 1) ~/ count;

    if (step == 0) step = 1;
    if(stop < step) step = -step;

    return IntRange._(start, stop, step);
  }

  Iterator<int> get iterator => IntRangeIterator(start, stop, step);

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

  bool operator ==(other) =>
      other is IntRange &&
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
      if (_pos + _step > _stop) return false;
    } else {
      if (_pos + _step < _stop) return false;
    }

    _pos += _step;
    return true;
  }
}
