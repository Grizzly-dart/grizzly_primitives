/// Provides the following primitives for universal use:
///
/// 1. [Pair]
/// Data structure to hold a key-value pair
/// 2. [Index1D]
/// 3. [Index2D]
/// 4. [Series]
/// 5. [DataFrame]
/// 6. [Array]
/// 7. [Numeric1D]
/// 8. [Array2D]
/// 9. [Numeric2D]
library grizzly_primitives;

export 'package:grizzly_primitives/src/core/core.dart';

export 'src/array/array.dart';

export 'src/array2d/array2d.dart';

export 'src/series/series.dart';

export 'src/dataframe/dataframe.dart';

class LengthMismatch implements Exception {
  final int expected;

  final int found;

  final String subject;

  const LengthMismatch({this.expected, this.found, this.subject});

  @override
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

class LabelNotFound<LT> implements Exception {
  final LT label;

  const LabelNotFound(this.label);

  @override
  String toString() => 'Label $label not found!';
}

LabelNotFound<LT> labelNotFound<LT>(LT label) => LabelNotFound<LT>(label);
