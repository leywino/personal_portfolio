import 'package:flutter/material.dart';
import 'package:personal_portfolio/extensions/extensions.dart';
import 'package:personal_portfolio/ui/common/constants.dart';
import 'package:personal_portfolio/ui/views/home/home_viewmodel.dart';
import 'package:personal_portfolio/ui/widgets/animated_hover_link.dart';
import 'package:visibility_detector/visibility_detector.dart';

class IntroSocials extends StatelessWidget {
  const IntroSocials({
    super.key,
    required HomeViewModel viewModel,
  }) : _viewModel = viewModel;

  final HomeViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const ValueKey("intro_socials"),
      onVisibilityChanged: (info) {
        if (!context.mounted) return;
        if (info.visibleFraction > 0.3) {
          _viewModel.controller!.forward();
        } else {
          if (_viewModel.controller!.isCompleted ||
              _viewModel.controller!.value == 1.0) {
            _viewModel.controller!.reset();
          }
        }
      },
      child: <Widget>[
        AnimatedHoverLink(
          label: ksGithub,
          controller: _viewModel.controller!,
        ).addInkWell(
          onTap: ksGithubLink.launchWebsite,
        ),
        const Text(ksSlash).addCenter().addSizedBox(
              width: s50,
            ),
        AnimatedHoverLink(
          label: ksLinkedIn,
          controller: _viewModel.controller!,
        ).addInkWell(
          onTap: ksLinkedInLink.launchWebsite,
        ),
      ].addRow(),
    );
  }
}
