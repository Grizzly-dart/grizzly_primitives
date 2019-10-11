import 'package:grizzly_primitives/grizzly_primitives.dart';
import 'package:test/test.dart';

void main() {
  group('Ranger.Months', () {
    setUp(() {});

    test('floor', () {
      DateTime date = new DateTime(2017, 9, 9, 1, 2, 3, 4, 5);
      expect(Ranger.monthsRange.floor(date), new DateTime(2017, 9));
    });

    test('step', () {
      DateTime date = new DateTime(2017, 9, 9, 1, 2, 3, 4, 5);
      expect(Ranger.monthsRange.step(date, 1),
          new DateTime(2017, 10, 9, 1, 2, 3, 4, 5));
    });

    test('step', () {
      DateTime date = new DateTime(2017, 10, 31, 1, 2, 3, 4, 5);
      expect(Ranger.monthsRange.step(date, 1),
          new DateTime(2017, 11, 30, 1, 2, 3, 4, 5));
    });

    test('step', () {
      DateTime date = new DateTime(2017, 10, 31, 1, 2, 3, 4, 5);
      expect(Ranger.monthsRange.step(date, 12),
          new DateTime(2018, 10, 31, 1, 2, 3, 4, 5));
    });
  });
}
