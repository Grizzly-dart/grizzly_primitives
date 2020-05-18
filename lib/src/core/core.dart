library grizzly.primitives;

import 'package:grizzly_primitives/grizzly_primitives.dart';

part 'index.dart';

/// Interface for a labeled data-structure. Example: [Series] and [DataFrame]
abstract class Labeled<LT> {
  /// Returns all labels of [this].
  Iterable<LT> get labels;

  /// Returns label at [position]
  LT labelAt(int position);

  /// Returns the position of [label]. Returns -1, if [label] is not found.
  int posOf(LT label);

  /// Returns true if [this] contains [label]
  bool containsLabel(LT label);

  /// Returns true if [this]'s labels exactly matches [labels] in order and size.
  bool labelsMatch(final /*Labeled<LT> | Iterable<LT> */ labels);

  /// If [this] is a size-mutable, new labels are added to the data-structure.
  /// If [this] is size-immutable or view, an exception is thrown if [labels]
  /// contains a label that is not already in [this].
  void ensureLabels(final /* Labeled<LT> | Iterable<LT> */ labels);
}
