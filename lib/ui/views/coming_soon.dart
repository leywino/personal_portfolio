import 'package:flutter/material.dart';
import 'package:personal_portfolio/ui/common/constants.dart';
import 'package:personal_portfolio/ui/widgets/animated_text_slide_box_transition.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ComingSoon extends StatefulWidget {
  const ComingSoon({super.key});

  @override
  State<ComingSoon> createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final textStyle = getValueForScreenType<TextStyle>(
      context: context,
      desktop: textTheme.displayMedium!.copyWith(
        fontWeight: FontWeight.bold,
        color: kCoralPink,
      ),
      mobile: textTheme.displaySmall!.copyWith(
        fontWeight: FontWeight.bold,
        color: kCoralPink,
      ),
    );

    return Scaffold(
      backgroundColor: kPrimary,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedTextSlideBoxTransition(
              controller: _controller,
              text: "Coming Soon",
              textStyle: textStyle,
              boxColor: kWhite,
              coverColor: kPrimary,
            ),
            verticalSpaceMedium,
            Text(
              "I'm working on this page. Stay tuned!",
              style: textTheme.bodyMedium?.copyWith(color: kWhite),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
