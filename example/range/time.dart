import 'package:grizzly_primitives/grizzly_primitives.dart';

main() {
  print(TimeRange(
      DateTime(2019, 1, 1), DateTime(2019, 1, 20), Duration(days: 1)));
  print(TimeRange(
      DateTime(2019, 1, 20), DateTime(2019, 1, 1), Duration(days: 1)));
  /*
  print(IntRange(5, -5));
  print(IntRange.until(5, 2));
  print(IntRange.linspace(1, 10, 5));
  print(IntRange.linspace(10, -8, 5));

  for (final i in IntRange(0, 5)) print(i);
  */

  print(
      TimeRange(DateTime(2019, 1, 1), DateTime(2019, 1, 20), Duration(days: 1))
          .length);
  print(
      TimeRange(DateTime(2019, 1, 20), DateTime(2019, 1, 1), Duration(days: 1))
          .length);
  /*
  print(IntRange(5, -5).length);
  print(IntRange.until(5, 2).length);
  print(IntRange.linspace(1, 10, 5).length);
  print(IntRange.linspace(10, -8, 5).length);
  */
}
