import 'package:flutter/material.dart';
import 'package:personal_portfolio/extensions/layout_adapter_ex.dart';
import 'package:personal_portfolio/ui/common/constants.dart';
import 'package:personal_portfolio/ui/widgets/animated_text_slide_box_transition.dart';

class AnimatedHoverLink extends AnimatedWidget {
  AnimatedHoverLink({
    super.key,
    required this.label,
    required this.controller,
  }) : super(listenable: controller);
  final AnimationController controller;
  final String label;

  final ValueNotifier<bool> _isHovered = ValueNotifier(false);
  void _onHover(bool isHovered) {
    _isHovered.value = isHovered;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (_, hover, __) {
        return MouseRegion(
          onEnter: (_) => _onHover(true),
          onHover: (_) => _onHover(true),
          onExit: (_) => _onHover(false),
          child: AnimatedTextSlideBoxTransition(
            controller: controller,
            coverColor: Theme.of(context).scaffoldBackgroundColor,
            text: label,
            boxColor: kWhite,
            textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                decoration: TextDecoration.underline,
                decorationThickness: hover ? s4 : s2,
                decorationColor: hover ? kWhite : kWhite50,
                fontSize: context.adaptive<double>(s16, s18)
                // color: kCoralPink,
                ),
          ),
        );
      },
      valueListenable: _isHovered,
    );
  }
}
