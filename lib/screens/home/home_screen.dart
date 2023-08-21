import 'package:flutter/material.dart';
import 'package:golden_ratio_colors/widgets/random_color/decorations/impl/endless_golden_ration_colors_decoration.dart';
import 'package:golden_ratio_colors/widgets/random_color/random_color_widget.dart';

/// Default or default screen of the app
class HomeScreen extends StatelessWidget {

  /// Default constructor for [HomeScreen] initialization
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RandomColorWidget(
        titleText: 'Hello there',
        randomColorsDecoration: EndlessGoldenRationColorsDecoration(),
      ),
    );
  }
}
