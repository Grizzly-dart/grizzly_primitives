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
export 'src/dataframe/dataframe.dart';
export 'src/series/series.dart';

export 'src/array/array.dart';
export 'src/array2d/array2d.dart';
