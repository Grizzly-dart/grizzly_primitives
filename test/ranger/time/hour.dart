import 'package:grizzly_primitives/grizzly_primitives.dart';
import 'package:test/test.dart';

void main() {
  group('Ranger.Hours', () {
    setUp(() {});

    test('floor', () {
      DateTime date = new DateTime(2017, 9, 9, 1, 2, 3, 4, 5);
      expect(Ranger.hoursRange.floor(date), new DateTime(2017, 9, 9, 1));
    });

    test('step', () {
      DateTime date = new DateTime(2017, 9, 9, 1, 2, 3, 4, 5);
      expect(Ranger.hoursRange.step(date, 1),
          new DateTime(2017, 9, 9, 2, 2, 3, 4, 5));
    });
  });
}
