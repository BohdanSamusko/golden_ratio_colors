import 'package:flutter/material.dart';

/// An abstraction that is used for obtaining random colors
abstract interface class RandomColorsDecoration{

  /// Returns random color based on provided arguments
  Color fetchRandomColor();
}
