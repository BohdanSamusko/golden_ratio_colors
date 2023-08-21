import 'package:flutter/material.dart';

/// Default saturation for generated colors that works fine with light theme
const defaultColorsSaturation = 0.5;

/// Value parameter that is used for creating [HSVColor].
/// Also, it is called as brightness of color
const defaultHsvColorValue = 0.95;

/// Φ (Phi), the golden ratio constant
const goldenRatioConst = 1.61803398875;

/// Max value for color's hue, from 0.0 to 360.0 inclusively.
/// Describes which color of the spectrum is represented.
/// A value of 0.0 represents red, as does 360.0. Values in between go through
/// all the hues representable in RGB.
const colorHueMaxValue = 360;

/// [GoldenRatioColors] mixin has a class for creating golden ration colors
mixin GoldenRatioColors {

  /// A method of [GoldenRatioColors] mixin that return golden ration color
  /// that is based on provided arguments
  Color getGoldenRatioColor({
    required double baseHueCoefficient,
    required int index,
    double saturation = defaultColorsSaturation,
    double brightness = defaultHsvColorValue,
  }) {
    final hueCoefficient =
        (baseHueCoefficient + index * goldenRatioConst) % 1.0;
    final finalHue = hueCoefficient * colorHueMaxValue;

    return HSVColor.fromAHSV(1.0, finalHue, saturation, brightness).toColor();
  }
}
