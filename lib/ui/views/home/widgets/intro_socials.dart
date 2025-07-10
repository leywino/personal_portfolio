import 'package:flutter/material.dart';
import 'package:personal_portfolio/extensions/extensions.dart';
import 'package:personal_portfolio/ui/common/constants.dart';
import 'package:personal_portfolio/ui/widgets/animated_hover_link.dart';
import 'package:visibility_detector/visibility_detector.dart';

class IntroSocials extends StatelessWidget {
  const IntroSocials({
    super.key,
    required AnimationController animationController,
  }) : _animationController = animationController;

  final AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const ValueKey("intro_socials"),
      onVisibilityChanged: (info) {
        if (!context.mounted) return;
        if (info.visibleFraction > 0.3) {
          _animationController.forward();
        } else {
          if (_animationController.isCompleted ||
              _animationController.value == 1.0) {
            _animationController.reset();
          }
        }
      },
      child: <Widget>[
        AnimatedHoverLink(
          label: ksGithub,
          controller: _animationController,
        ).addInkWell(
          onTap: ksGithubLink.launchWebsite,
        ),
        const Text(ksSlash).addCenter().addSizedBox(
              width: s50,
            ),
        AnimatedHoverLink(
          label: ksLinkedIn,
          controller: _animationController,
        ).addInkWell(
          onTap: ksLinkedInLink.launchWebsite,
        ),
      ].addRow(),
    );
  }
}
