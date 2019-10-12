import 'package:grizzly_primitives/grizzly_primitives.dart';
import 'package:test/test.dart';

void main() {
  group('Ranger.Minutes', () {
    setUp(() {});

    test('floor', () {
      DateTime date = DateTime(2017, 9, 9, 1, 2, 3, 4, 5);
      expect(Ranger.minutesRange.floor(date), DateTime(2017, 9, 9, 1, 2));
    });

    test('step', () {
      DateTime date = DateTime(2017, 9, 9, 1, 2, 3, 4, 5);
      expect(Ranger.minutesRange.step(date, 1),
          DateTime(2017, 9, 9, 1, 3, 3, 4, 5));
    });
  });
}
