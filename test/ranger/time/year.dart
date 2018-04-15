import 'package:grizzly_primitives/grizzly_primitives.dart';
import 'package:test/test.dart';

void main() {
  group('Ranger.Year', () {
    setUp(() {});

    test('floor', () {
      DateTime date = new DateTime(2017, 9, 9, 1, 2, 3, 4, 5);
      expect(Ranger.yearsRange.floor(date), new DateTime(2017));
    });

    test('step', () {
      DateTime date = new DateTime(2017, 9, 9, 1, 2, 3, 4, 5);
      expect(Ranger.yearsRange.step(date, 1),
          new DateTime(2018, 9, 9, 1, 2, 3, 4, 5));
    });

    test('step', () {
      DateTime date = new DateTime(2017, 9, 9, 1, 2, 3, 4, 5);
      expect(Ranger.yearsRange.step(date, 8),
          new DateTime(2025, 9, 9, 1, 2, 3, 4, 5));
    });
  });
}
