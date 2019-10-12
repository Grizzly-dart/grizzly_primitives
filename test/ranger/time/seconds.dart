import 'package:grizzly_primitives/grizzly_primitives.dart';
import 'package:test/test.dart';

void main() {
  group('Ranger.Seconds', () {
    setUp(() {});

    test('floor', () {
      DateTime date = DateTime(2017, 9, 9, 1, 2, 3, 4, 5);
      expect(Ranger.secondsRange.floor(date), DateTime(2017, 9, 9, 1, 2, 3));
    });

    test('step', () {
      DateTime date = DateTime(2017, 9, 9, 1, 2, 3, 4, 5);
      expect(Ranger.secondsRange.step(date, 1),
          DateTime(2017, 9, 9, 1, 2, 4, 4, 5));
    });
  });
}
