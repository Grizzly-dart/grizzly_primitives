import 'package:grizzly_primitives/grizzly_primitives.dart';
import 'package:test/test.dart';

void main() {
  group('Tests', () {
    setUp(() {});

    test('Index1', () {
      final i1 = Index1D(5);
      expect(i1.dim, 1);
      expect(i1.x, 5);
      expect(i1[0], 5);
      expect(i1.toList(), [5]);

      expect(i1 > Index1D(2), true);
      expect(i1 > Index1D(10), false);
      expect(i1 >= Index1D(2), true);
      expect(i1 >= Index1D(10), false);
      expect(i1 >= Index1D(5), true);

      expect(i1 < Index1D(2), false);
      expect(i1 < Index1D(10), true);
      expect(i1 <= Index1D(2), false);
      expect(i1 <= Index1D(10), true);
      expect(i1 <= Index1D(5), true);
    });

    test('Index2', () {
      final i2 = Index2D(5, 25);
      expect(i2.dim, 2);
      expect(i2.row, 5);
      expect(i2.col, 25);
      expect(i2[0], 5);
      expect(i2[1], 25);
      expect(i2.toList(), Index2D(5, 25));
      expect(i2 == Index2D(5, 25), true);
      expect(i2 == Index2D(5, 24), false);

      expect(i2 > Index2D(0, 0), true);
      expect(i2 > Index2D(10, 20), false);
      expect(i2 >= Index2D(5, 5), true);
      expect(i2 >= Index2D(4, 30), false);
      expect(i2 >= Index2D(5, 25), true);

      expect(i2 < Index2D(4, 30), false);
      expect(i2 < Index2D(10, 30), true);
      expect(i2 <= Index2D(10, 20), false);
      expect(i2 <= Index2D(10, 30), true);
      expect(i2 <= Index2D(5, 25), true);
    });
  });
}
