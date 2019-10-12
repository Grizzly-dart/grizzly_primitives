import 'package:grizzly_primitives/grizzly_primitives.dart';

main() {
  print(DoubleRange(0, 5, 0.5));
  print(DoubleRange(5, -5));
  print(DoubleRange.until(5, 2));
  print(DoubleRange.linspace(-4.5, 20.5, 5));
  print(DoubleRange.linspace(10, -8, 5));

  for(final i in DoubleRange(0, 5)) print(i);

  print(DoubleRange(0, 5, 0.5).length);
  print(DoubleRange(5, -5).length);
  print(DoubleRange.until(5, 2).length);
  print(DoubleRange.linspace(-4.5, 20.5, 5).length);
  print(DoubleRange.linspace(10, -8, 5).length);
}