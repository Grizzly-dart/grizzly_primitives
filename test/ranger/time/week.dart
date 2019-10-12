import 'package:grizzly_primitives/grizzly_primitives.dart';
import 'package:test/test.dart';

void main() {
  group('Ranger.Weeks', () {
    setUp(() {});

    test('floor', () {
      DateTime date = DateTime(2017, 9, 9, 1, 2, 3, 4, 5);
      expect(Ranger.weeksRange.floor(date), DateTime(2017, 9, 3));
    });

    test('step', () {
      DateTime date = DateTime(2017, 9, 9, 1, 2, 3, 4, 5);
      expect(Ranger.weeksRange.step(date, 1),
          DateTime(2017, 9, 16, 1, 2, 3, 4, 5));
    });
  });
}
