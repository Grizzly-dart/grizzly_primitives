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

    test('linspace', () {
      final ranger = new DoubleRangeIterable.linspace(0.0, 100.0, 10);
      expect(ranger, new List.generate(11, (i) => i * 10));
    });

    test('linspace.unit_space', () {
      final ranger = new DoubleRangeIterable.linspace(0.0, 1.0, 10);
      expect(ranger, [
        0.0,
        0.1,
        0.2,
        0.30000000000000004,
        0.4,
        0.5,
        0.6,
        0.7,
        0.7999999999999999,
        0.8999999999999999,
        0.9999999999999999,
      ]);
    });
  });
}
