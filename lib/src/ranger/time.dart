part of grizzly.viz.scales.ranger;

class TimeRange extends IterableBase<DateTime> {
  /// Starting value of the range
  final DateTime start;

  /// End value of the sequence
  final DateTime stop;

  /// Spacing between values
  final Duration step;

  TimeRange._(this.start, this.stop, this.step);

  /// Returns an iterable of integers from [start] inclusive to [stop] inclusive
  /// with [step].
  ///
  ///     print(IntRange(0, 5)); => (0, 1, 2, 3, 4, 5)
  factory TimeRange(DateTime start, DateTime stop, Duration step) {
    if (step.isNegative)
      throw ArgumentError.value(step, 'step', 'Must be greater than 0');
    if (stop.isBefore(start)) step = -step;
    return TimeRange._(start, stop, step);
  }

  Iterator<DateTime> get iterator => TimeRangeIterator(start, stop, step);

  int get length {
    if (step.inMicroseconds == 0) throw Exception("Step cannot be 0");
    if (!step.isNegative) {
      if (start.isAfter(stop))
        throw Exception("start cannot be after stop when step is positive!");
      int ret =
          (stop.difference(start).inMicroseconds / step.inMicroseconds).ceil();
      final last = start.add(step * ret);
      if (last.isBefore(stop) || last.isAtSameMomentAs(stop)) ret++;
      return ret;
    } else {
      if (start.isBefore(stop))
        throw Exception("start cannot be before stop when step is negative!");
      int ret =
          (start.difference(stop).inMicroseconds / -step.inMicroseconds).ceil();
      final last = start.add(step * ret);
      if (last.isAfter(stop) || last.isAtSameMomentAs(stop)) ret++;
      return ret;
    }
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
      other is TimeRange &&
      start == other.start &&
      stop == other.stop &&
      step == other.step;
}

class TimeRangeIterator implements Iterator<DateTime> {
  DateTime _pos;
  final DateTime _stop;
  final Duration _step;

  TimeRangeIterator(DateTime pos, DateTime stop, Duration step)
      : _stop = stop,
        _pos = pos.subtract(step),
        _step = step;

  DateTime get current => _pos;

  bool moveNext() {
    final next = _pos.add(_step);
    if (!_step.isNegative) {
      if (next.isAfter(_stop)) return false;
    } else {
      if (next.isBefore(_stop)) return false;
    }

    _pos = _pos.add(_step);
    return true;
  }
}

/*
abstract class TimeRange {
  const TimeRange();

  DateTime step(DateTime date, num steps);

  /*
  DateTime floor(DateTime date);

  DateTime ceil(DateTime date) => step(floor(date), 1);

  DateTime round(DateTime date) {
    final DateTime d0 = floor(date);
    final DateTime d1 = step(d0, 1);

    if (date.difference(d0) < d1.difference(date)) {
      return d0;
    } else {
      return d1;
    }
  }
   */

  List<DateTime> range(DateTime start, DateTime stop, [int skip = 0]) {
    final values = <DateTime>[];

    DateTime time = start;
    if (skip > 0) {
      while (time.isBefore(stop)) {
        values.add(time);
        time = step(time, skip);
      }
    } else {
      while (time.isBefore(stop)) {
        values.add(time);
        time = step(time, 1);
      }
    }

    return values;
  }
}

class MicrosecondsRange extends TimeRange {
  const MicrosecondsRange();

  DateTime step(DateTime date, num steps) =>
      date.add(Duration(microseconds: steps));

  DateTime floor(DateTime date) => date;
}

class MillisecondsRange extends TimeRange {
  const MillisecondsRange();

  DateTime step(DateTime date, num steps) =>
      date.add(Duration(milliseconds: steps));

  DateTime floor(DateTime date) =>
      date.subtract(Duration(microseconds: date.microsecond));
}

class SecondsRange extends TimeRange {
  const SecondsRange();

  DateTime step(DateTime date, num steps) => date.add(Duration(seconds: steps));

  DateTime floor(DateTime date) => date.subtract(
      Duration(microseconds: date.microsecond, milliseconds: date.millisecond));
}

class MinutesRange extends TimeRange {
  const MinutesRange();

  DateTime step(DateTime date, num steps) => date.add(Duration(minutes: steps));

  DateTime floor(DateTime date) => date.subtract(Duration(
      seconds: date.second,
      microseconds: date.microsecond,
      milliseconds: date.millisecond));
}

class HoursRange extends TimeRange {
  const HoursRange();

  DateTime step(DateTime date, num steps) => date.add(Duration(hours: steps));

  DateTime floor(DateTime date) => date.subtract(Duration(
      minutes: date.minute,
      seconds: date.second,
      milliseconds: date.millisecond,
      microseconds: date.microsecond));
}

class DaysRange extends TimeRange {
  const DaysRange();

  DateTime step(DateTime date, num steps) => date.add(Duration(days: steps));

  DateTime floor(DateTime date) => date.subtract(Duration(
      hours: date.hour,
      minutes: date.minute,
      seconds: date.second,
      milliseconds: date.millisecond,
      microseconds: date.microsecond));
}

class WeeksRange extends TimeRange {
  const WeeksRange();

  DateTime step(DateTime date, num steps) =>
      date.add(Duration(days: steps * 7));

  DateTime floor(DateTime date) => date.subtract(Duration(
      days: date.weekday % 7,
      hours: date.hour,
      minutes: date.minute,
      seconds: date.second,
      milliseconds: date.millisecond,
      microseconds: date.microsecond));
}

class MonthsRange extends TimeRange {
  const MonthsRange();

  static const Duration _day = const Duration(days: 1);

  DateTime step(DateTime date, num steps) {
    DateTime ret = DateTime(date.year, date.month + steps, date.day, date.hour,
        date.minute, date.second, date.millisecond, date.microsecond);

    if (ret.month != DateTime.february) {
      if (date.day == 31 && ret.day != 31) {
        ret = ret.subtract(_day);
      }
    } else {
      if (ret.day >= 29 && ret.day <= 31) {
        if (date.day == 29 && ret.day != 29) {
          ret = DateTime(
            ret.year,
            DateTime.february,
            29,
            ret.hour,
            ret.minute,
            ret.second,
            ret.millisecond,
            ret.microsecond,
          );
        }
      }
    }

    return ret;
  }

  DateTime floor(DateTime date) => DateTime(date.year, date.month, 1);
}

class YearsRange extends TimeRange {
  const YearsRange();

  DateTime step(DateTime date, num steps) => DateTime(
        date.year + steps,
        date.month,
        date.day,
        date.hour,
        date.minute,
        date.second,
        date.millisecond,
        date.microsecond,
      );

  DateTime floor(DateTime date) => DateTime(date.year, 1, 1);
}
*/
