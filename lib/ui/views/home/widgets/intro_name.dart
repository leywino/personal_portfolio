import 'package:flutter/material.dart';
import 'package:personal_portfolio/ui/common/constants.dart';
import 'package:personal_portfolio/ui/views/home/home_viewmodel.dart';
import 'package:personal_portfolio/ui/widgets/animated_text_slide_box_transition.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';

class IntroName extends StatelessWidget {
  const IntroName({
    super.key,
    required HomeViewModel viewModel,
  }) : _viewModel = viewModel;

  final HomeViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    bool isLessThan1300() {
      return screenWidth(context) < 1300;
    }

    final children = [
      VisibilityDetector(
        key: const ValueKey("introducing_name_widget"),
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
        child: Text(ksHiMyNameIs,
            style: getValueForScreenType<TextStyle>(
                context: context,
                desktop: Theme.of(context).textTheme.displayMedium!,
                mobile: Theme.of(context).textTheme.displaySmall!)),
      ),
      horizontalSpaceMassive,
      AnimatedTextSlideBoxTransition(
        boxColor: kWhite,
        controller: _viewModel.controller!,
        coverColor: Theme.of(context).scaffoldBackgroundColor,
        text: ksRealName,
        textStyle: getValueForScreenType<TextStyle>(
            context: context,
            desktop: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontWeight: FontWeight.bold, color: kCoralPink),
            mobile: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(fontWeight: FontWeight.bold, color: kCoralPink)),
      ),
    ];

    return ScreenTypeLayout.builder(
      desktop: (context) => Row(
        mainAxisAlignment: isLessThan1300()
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: children,
      ),
      mobile: (context) => Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}
