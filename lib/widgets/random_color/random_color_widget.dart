import 'package:flutter/material.dart';

import 'package:golden_ratio_colors/widgets/random_color/decorations/random_colors_decoration.dart';

/// Default duration for animation that changes colors of background
const Duration defaultColorSwitchingAnimationDuration =
    Duration(milliseconds: 300);

/// Determines a pause duration between color switching that enables the user
/// to percept a color clearly.
///
/// It is used only in case when endless colors switching if enabled.
const Duration pauseBetweenSwitchingColors = Duration(milliseconds: 200);

/// Random color widget that uses random colors for its background
class RandomColorWidget extends StatefulWidget {
  /// Constructor for initializing [RandomColorWidget]
  const RandomColorWidget({
    required this.titleText,
    required this.randomColorsDecoration,
    this.animationDuration = defaultColorSwitchingAnimationDuration,
    super.key,
  });

  /// Title that is displayed in the middle of the screen
  final String titleText;

  /// Duration of background colors changing animation
  final Duration animationDuration;

  /// Decoration for generating random colors
  final RandomColorsDecoration randomColorsDecoration;

  @override
  State<RandomColorWidget> createState() => _RandomColorWidgetState();
}

class _RandomColorWidgetState extends State<RandomColorWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final ColorTween _backgroundColorTween = ColorTween();

  //ignore: avoid-late-keyword
  late Color _backgroundColor;
  bool _isEndlessAnimationActive = false;

  @override
  void initState() {
    super.initState();
    _backgroundColor = widget.randomColorsDecoration.fetchRandomColor();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    _animationController.addListener(() {
      final updatedColor =
          _backgroundColorTween.evaluate(_animationController) ??
              _backgroundColor;
      setState(() {
        _backgroundColor = updatedColor;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onLongPress: switchEndlessAnimation,
        onTap: () {
          _isEndlessAnimationActive = false;
          changeBackgroundColor();
        },
        child: ColoredBox(
          color: _backgroundColor,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.titleText,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  'Long press to enable\nendless animation',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> changeBackgroundColor() async {
    final newBackgroundColor = widget.randomColorsDecoration.fetchRandomColor();
    _backgroundColorTween
      ..begin = _backgroundColor
      ..end = newBackgroundColor;
    _animationController.reset();

    return _animationController.forward();
  }

  Future<void> switchEndlessAnimation() async {
    _isEndlessAnimationActive = true;
    while (_isEndlessAnimationActive) {
      await changeBackgroundColor();
      await Future.delayed(pauseBetweenSwitchingColors);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }
}
