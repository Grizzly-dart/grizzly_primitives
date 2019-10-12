import 'package:grizzly_primitives/grizzly_primitives.dart';
import 'package:test/test.dart';

void main() {
  group('Ranger.int', () {
    setUp(() {});

    test('forward', () {
      final ranger = IntRange(0, 100, 10);
      expect(ranger, List.generate(11, (i) => i * 10));
    });

    test('reverse', () {
      final ranger = IntRange(100, 0, -10);
      expect(ranger, List.generate(11, (i) => i * 10).reversed);
    });

    test('until', () {
      final ranger = IntRange.until(10, 2);
      expect(ranger, List.generate(6, (i) => i * 2));

      // final ranger2 =  ConstantIterable(10, 5);
      // print(ranger2.toList());
    });

    test('until.neg stop', () {
      final ranger = IntRange.until(-10, -2);
      expect(ranger, List.generate(6, (i) => -i * 2));
    });
  });
}
