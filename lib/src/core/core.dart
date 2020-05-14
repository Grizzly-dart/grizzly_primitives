library grizzly.primitives;

part 'package:grizzly_primitives/src/core/pair.dart';
part 'package:grizzly_primitives/src/core/index.dart';

/// Prototype of name makers for `Series` and `Array`
typedef NameMaker = String Function();

abstract class Labeled<LT> {
  Iterable<LT> get labels;

  /// Returns label at [position]
  LT labelAt(int position);

  int posOf(LT lab);

  bool containsLabel(LT lab);

  bool labelsMatch(final /*Labeled<LT> | Iterable<LT> */ labels);
}
