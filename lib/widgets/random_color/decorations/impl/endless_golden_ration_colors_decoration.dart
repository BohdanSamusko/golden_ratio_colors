import 'dart:math' as math;
import 'dart:ui';

import 'package:golden_ratio_colors/widgets/random_color/decorations/random_colors_decoration.dart';
import 'package:golden_ratio_colors/widgets/random_color/golden_ratio/golden_ratio_colors.dart';

/// [EndlessGoldenRationColorsDecoration] enables to fetch random colors
/// that are based on golden ration rule. Each color that
/// [EndlessGoldenRationColorsDecoration] makes is absolutely unique and
/// unrepeatable.
class EndlessGoldenRationColorsDecoration
    with GoldenRatioColors
    implements RandomColorsDecoration {
  int _index = 0;
  final double _baseHue;

  /// Instantiate [EndlessGoldenRationColorsDecoration].
  ///
  /// Also, [EndlessGoldenRationColorsDecoration._baseHue] is a starting
  /// point of the algorithm and is generated in a random way.
  EndlessGoldenRationColorsDecoration() : _baseHue = math.Random().nextDouble();

  @override
  Color fetchRandomColor() {
    final color =
        getGoldenRatioColor(baseHueCoefficient: _baseHue, index: _index);
    _index++;

    return color;
  }
}
