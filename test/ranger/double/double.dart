import 'package:grizzly_primitives/grizzly_primitives.dart';
import 'package:test/test.dart';

void main() {
  group('Ranger.Double', () {
    setUp(() {});

    test('forward', () {
      final ranger = new DoubleRangeIterable(0.0, 100.0, 10.0);
      expect(ranger, new List.generate(11, (i) => i * 10));
    });

    test('reverse', () {
      final ranger = new DoubleRangeIterable(100.0, 0.0, -10.0);
      expect(ranger, new List.generate(11, (i) => i * 10).reversed);
    });

    test('until', () {
      final ranger = new DoubleRangeIterable.until(10.0, 2.0);
      expect(ranger, new List.generate(6, (i) => i * 2));
    });

    test('until.neg stop', () {
      final ranger = new DoubleRangeIterable.until(-10.0, -2.0);
      expect(ranger, new List.generate(6, (i) => -i * 2));
    });

    test('linspace.normal', () {
      final ranger = new DoubleRangeIterable.linspace(0.0, 100.0, 10);
      expect(ranger, [
        0.0,
        11.11111111111111,
        22.22222222222222,
        33.33333333333333,
        44.44444444444444,
        55.55555555555556,
        66.66666666666667,
        77.77777777777779,
        88.8888888888889,
        100.00000000000001
      ]);
    });

    test('linspace.unit_space', () {
      final ranger = new DoubleRangeIterable.linspace(0.0, 1.0, 10);
      expect(ranger, [
        0.0,
        0.1111111111111111,
        0.2222222222222222,
        0.3333333333333333,
        0.4444444444444444,
        0.5555555555555556,
        0.6666666666666667,
        0.7777777777777779,
        0.8888888888888891,
        1.0000000000000002
      ]);
    });
  });
}
