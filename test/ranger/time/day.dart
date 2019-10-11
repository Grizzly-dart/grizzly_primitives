import 'package:grizzly_primitives/grizzly_primitives.dart';
import 'package:test/test.dart';

void main() {
  group('Ranger.Days', () {
    setUp(() {});

    test('floor', () {
      DateTime date = new DateTime(2017, 9, 9, 1, 2, 3, 4, 5);
      expect(Ranger.daysRange.floor(date), new DateTime(2017, 9, 9));
    });

    test('step', () {
      DateTime date = new DateTime(2017, 9, 9, 1, 2, 3, 4, 5);
      expect(Ranger.daysRange.step(date, 1),
          new DateTime(2017, 9, 10, 1, 2, 3, 4, 5));
    });

    test('step', () {
      DateTime date = new DateTime(2017, 9, 30, 1, 2, 3, 4, 5);
      expect(Ranger.daysRange.step(date, 1),
          new DateTime(2017, 10, 1, 1, 2, 3, 4, 5));
    });

    test('step', () {
      DateTime date = new DateTime(2017, 12, 31, 1, 2, 3, 4, 5);
      expect(Ranger.daysRange.step(date, 1),
          new DateTime(2018, 1, 1, 1, 2, 3, 4, 5));
    });
  });
}
