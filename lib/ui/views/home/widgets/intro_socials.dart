import 'package:flutter/material.dart';
import 'package:personal_portfolio/extensions/extensions.dart';
import 'package:personal_portfolio/ui/common/constants.dart';
import 'package:personal_portfolio/ui/views/home/home_viewmodel.dart';
import 'package:personal_portfolio/ui/widgets/animated_hover_link.dart';

class IntroSocials extends StatelessWidget {
  const IntroSocials({
    super.key,
    required HomeViewModel viewModel,
  }) : _viewModel = viewModel;

  final HomeViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    bool isLessThan1300() {
      return screenWidth(context) < 1300;
    }

    return <Widget>[
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
    ].addRow(
        mainAxisAlignment: isLessThan1300()
            ? MainAxisAlignment.center
            : MainAxisAlignment.start);
  }
}
