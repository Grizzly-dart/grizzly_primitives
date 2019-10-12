library grizzly.primitives;

import 'package:meta/meta.dart';

part 'package:grizzly_primitives/src/core/pair.dart';
part 'package:grizzly_primitives/src/core/extent.dart';
part 'package:grizzly_primitives/src/core/index.dart';

/// Prototype of name makers for `Series` and `Array`
typedef String NameMaker();

abstract class Labeled<LT> {
  Iterable<LT> get labels;

  /// Returns label at [position]
  LT labelAt(int position);

  int posOf(LT lab);

  bool containsLabel(LT lab);

  bool labelsMatch(final /*Labeled<LT> | Iterable<LT> */ labels);
}
