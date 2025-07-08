import 'package:flutter/material.dart';
import 'package:personal_portfolio/ui/common/constants.dart';
import 'package:personal_portfolio/ui/views/home/home_viewmodel.dart';
import 'package:personal_portfolio/ui/widgets/animated_text_slide_box_transition.dart';
import 'package:responsive_builder/responsive_builder.dart';

class IntroName extends StatelessWidget {
  const IntroName({
    super.key,
    required HomeViewModel viewModel,
  }) : _viewModel = viewModel;

  final HomeViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    final children = [
      Text(
        ksHiMyNameIs,
        style: getValueForScreenType<TextStyle>(
            context: context,
            desktop: Theme.of(context).textTheme.displayMedium!,
            mobile: Theme.of(context).textTheme.displaySmall!,
            tablet: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(fontSize: screenWidth(context)*0.044)),
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
                .copyWith(fontWeight: FontWeight.bold, color: kCoralPink),
            tablet: Theme.of(context).textTheme.displaySmall!.copyWith(
                fontWeight: FontWeight.bold, color: kCoralPink, fontSize: screenWidth(context)*0.044)),
      ),
    ];

    return ScreenTypeLayout.builder(
      desktop: (context) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: children,
      ),
      tablet: (context) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: children,
      ),
      mobile: (context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
