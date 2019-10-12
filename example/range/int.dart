import 'package:grizzly_primitives/grizzly_primitives.dart';

main() {
  print(IntRange(0, 5));
  print(IntRange(5, -5));
  print(IntRange.until(5, 2));
  print(IntRange.linspace(1, 10, 5));
  print(IntRange.linspace(10, -8, 5));

  for(final i in IntRange(0, 5)) print(i);

  print(IntRange(0, 5).length);
  print(IntRange(5, -5).length);
  print(IntRange.until(5, 2).length);
  print(IntRange.linspace(1, 10, 5).length);
  print(IntRange.linspace(10, -8, 5).length);
}