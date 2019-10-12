/// Provides the following primitives for universal use:
///
/// 1. [Pair]
/// Data structure to hold a key-value pair
/// 2. [Extent]
/// Holds a lower-upper extent
/// 3. [Index1D]
/// 4. [Index2D]
/// 5. [Series]
/// 6. [DataFrame]
/// 7. [Array]
/// 8. [Numeric1D]
/// 9. [Array2D]
/// 10. [Numeric2D]
library grizzly_primitives;

export 'package:grizzly_primitives/src/core/core.dart';

export 'src/array/array.dart';

export 'src/array2d/array2d.dart';

export 'src/series/series.dart';

export 'src/dataframe/dataframe.dart';

export 'src/ranger/ranger.dart';

class LengthMismatch implements Exception {
  final int expected;

  final int found;

  final String subject;

  const LengthMismatch({this.expected, this.found, this.subject});

  String toString() {
    final sb = StringBuffer();

    sb.write('Length mismatch');

    if (subject != null) sb.write(' for $subject');

    if (expected != null) {
      sb.write('! Expected $expected');

      if (found != null) {
        sb.write(' found $found');
      }
    }

    sb.write('!');
    return sb.toString();
  }
}

LengthMismatch lengthMismatch({int expected, int found, String subject}) =>
    LengthMismatch(expected: expected, found: found, subject: subject);

class LabelNotFound<LT> {
  final LT label;

  const LabelNotFound(this.label);

  String toString() => 'Label $label not found!';
}

LabelNotFound<LT> labelNotFound<LT>(LT label) => LabelNotFound<LT>(label);
