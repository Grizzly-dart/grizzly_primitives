library grizzly.primitives;

import 'package:meta/meta.dart';

part 'package:grizzly_primitives/src/core/pair.dart';
part 'package:grizzly_primitives/src/core/extent.dart';
part 'package:grizzly_primitives/src/core/index.dart';

abstract class Labeled<LT> {
  Iterable<LT> get labels;

  int posOf(LT lab);

  bool containsLabel(LT lab);

  bool labelsMatch(
      final /* IterView<LT> | Labeled<LT> | Iterable<LT> */ labels);
}
