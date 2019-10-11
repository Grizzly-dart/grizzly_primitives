library grizzly.viz.scales.ranger;

import 'dart:math' as math;
import 'dart:collection';

part 'constant_iterable.dart';
part 'double_iterable.dart';
part 'int_iterable.dart';
part 'time.dart';

abstract class Ranger {
  static Iterable<T> range<T extends num>(T start, T stop, [T step]) {
    if (start is int) {
      return new IntRangeIterable(start, stop as int, step?.toInt() ?? 1)
          as Iterable<T>;
    } else if (start is double) {
      return new DoubleRangeIterable(
          start, stop as double, step?.toDouble() ?? 1.0) as Iterable<T>;
    }

    throw new Exception('Unknown type $T');
  }

  @deprecated
  static Iterable<T> between<T extends num>(T start, T stop, [T step]) =>
      range<T>(start, stop, step);

  static Iterable<T> until<T extends num>(T stop, [T step]) {
    if (stop is int) {
      return new IntRangeIterable.until(stop, step?.toInt() ?? 1) as Iterable<T>;
    } else if (stop is double) {
      return new DoubleRangeIterable.until(stop, step?.toDouble() ?? 1.0)
          as Iterable<T>;
    }

    throw new Exception('Unknown type $T');
  }

  static Iterable<int> indices(int length) =>
      new IntRangeIterable(0, length - 1);

  static Iterable<T> linspace<T extends num>(T start, T stop,
      [int count = 50]) {
    if (start is int) {
      return new IntRangeIterable.linspace(start, stop as int, count)
          as Iterable<T>;
    } else if (start is double) {
      return new DoubleRangeIterable.linspace(start, stop as double, count)
          as Iterable<T>;
    }

    throw new Exception('Unknown type T');
  }

  static Iterable<int> zeros([int length = 10]) =>
      new ConstantIterable(0, length);

  static Iterable<int> ones([int length = 10]) =>
      new ConstantIterable(1, length);

  static Iterable<int> onesLike(Iterable iterable) =>
      new ConstantIterable(1, iterable.length);

  static Iterable<T> filled<T>(T value, [int length = 10]) =>
      new ConstantIterable<T>(value, length);

  static Iterable<T> filledLike<T>(T value, Iterable iterable) =>
      new ConstantIterable<T>(value, iterable.length);

  /// Returns an [Iterable] of approximately `count + 1` uniformly-spaced,
  /// nicely-rounded values between [start] and [stop] (inclusive).
  static Iterable<num> ticks(num start, num stop, num count) {
    final bool isReverse = stop < start;

    if (isReverse) {
      final temp = start;
      start = stop;
      stop = temp;
    }

    final num step = tickIncrement(start, stop, count);

    // If step is 0 or infinite, can't compute ticks
    if (step == 0 || step.isInfinite) return <num>[];

    if (step > 0) {
      // Positive step
      start = (start / step).ceil();
      stop = (stop / step).floor();
      final int len = (stop - start + 1).ceil();
      final ticks = new List<num>(len);
      for (int i = 0; i < len; i++) {
        ticks[i] = (start + i) * step;
      }

      return isReverse ? ticks.reversed : ticks;
    } else {
      // Negative step
      start = (start * step).floor();
      stop = (stop * step).ceil();
      final int len = (stop - start + 1).ceil();
      final ticks = new List<num>(len);
      for (int i = 0; i < len; i++) {
        ticks[i] = (start - i) / step;
      }

      return isReverse ? ticks.reversed : ticks;
    }
  }

  static num tickIncrement(num start, num stop, int count) {
    final double step = (stop - start) / math.max(0, count);
    final int power = (math.log(step) / math.ln10).floor();
    final num exp = math.pow(10, power);
    final double error = step / exp;

    if (power >= 0) {
      if (error >= e10)
        return 10 * exp;
      else if (error >= e5)
        return 5 * exp;
      else if (error >= e2)
        return 2 * exp;
      else
        return 1 * exp;
    } else {
      final num negExp = -math.pow(10, -power);
      if (error >= e10)
        return negExp / 10;
      else if (error >= e5)
        return negExp / 5;
      else if (error >= e2)
        return negExp / 2;
      else
        return negExp;
    }
  }

  static num tickStep(num start, num stop, num count) {
    final num step0 = (stop - start).abs() / math.max(0, count);
    num step1 = math.pow(10, (math.log(step0) / math.ln10).floor());
    final num error = step0 / step1;

    if (error >= e10) step1 *= 10;
    if (error >= e5) step1 *= 5;
    if (error >= e2) step1 *= 2;

    return stop < start ? -step1 : step1;
  }

  static final num e10 = math.sqrt(50);
  static final num e5 = math.sqrt(10);
  static final num e2 = math.sqrt(2);

  static const MicrosecondsRange microsecondsRange = const MicrosecondsRange();

  static const MillisecondsRange millisecondsRange = const MillisecondsRange();

  static const SecondsRange secondsRange = const SecondsRange();

  static const MinutesRange minutesRange = const MinutesRange();

  static const HoursRange hoursRange = const HoursRange();

  static const DaysRange daysRange = const DaysRange();

  static const WeeksRange weeksRange = const WeeksRange();

  static const MonthsRange monthsRange = const MonthsRange();

  static const YearsRange yearsRange = const YearsRange();

  static List<DateTime> microseconds(DateTime start, DateTime stop,
          [int skip = 0]) =>
      microsecondsRange.range(start, stop, skip);

  static List<DateTime> milliseconds(DateTime start, DateTime stop,
          [int skip = 0]) =>
      millisecondsRange.range(start, stop, skip);

  static List<DateTime> seconds(DateTime start, DateTime stop,
          [int skip = 0]) =>
      secondsRange.range(start, stop, skip);

  static List<DateTime> minutes(DateTime start, DateTime stop,
          [int skip = 0]) =>
      minutesRange.range(start, stop, skip);

  static List<DateTime> hours(DateTime start, DateTime stop, [int skip = 0]) =>
      hoursRange.range(start, stop, skip);

  static List<DateTime> days(DateTime start, DateTime stop, [int skip = 0]) =>
      daysRange.range(start, stop, skip);

  static List<DateTime> weeks(DateTime start, DateTime stop, [int skip = 0]) =>
      weeksRange.range(start, stop, skip);

  static List<DateTime> months(DateTime start, DateTime stop, [int skip = 0]) =>
      monthsRange.range(start, stop, skip);

  static List<DateTime> years(DateTime start, DateTime stop, [int skip = 0]) =>
      yearsRange.range(start, stop, skip);
}

typedef TimeRangerFunc = List<DateTime> Function(DateTime, DateTime, [int]);
