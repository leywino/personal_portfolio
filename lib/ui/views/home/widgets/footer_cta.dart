import 'package:flutter/material.dart';
import 'package:personal_portfolio/ui/widgets/animated_text_slide_box_transition.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:personal_portfolio/extensions/widget_ex.dart';
import 'package:personal_portfolio/ui/common/constants.dart';

class FooterCTA extends StatelessWidget {
  const FooterCTA(
      {super.key,
      required DeviceScreenType deviceType,
      required this.textController})
      : _deviceType = deviceType;

  final DeviceScreenType _deviceType;
  final AnimationController textController;

  @override
  Widget build(BuildContext context) {
    final isMobile = _deviceType == DeviceScreenType.mobile;
    final theme = Theme.of(context).textTheme;

    return <Widget>[
      AnimatedTextSlideBoxTransition(
        boxColor: kLightGray,
        coverColor: kDarkSlate,
        controller: textController,
        text: ksWorkingTogether,
        textStyle: theme.titleMedium!.copyWith(
          color: kLightGray,
          fontWeight: FontWeight.bold,
          fontFamily: "JetBrainsMono",
          height: 1.4,
        ),
        textAlign: isMobile ? TextAlign.center : TextAlign.left,
      ),
      verticalSpaceTiny,
      AnimatedTextSlideBoxTransition(
        boxColor: kLightGray,
        coverColor: kDarkSlate,
        controller: textController,
        text: ksOpenToWork,
        textStyle: theme.bodyMedium!.copyWith(
          color: kLightGray,
          fontFamily: "JetBrainsMono",
        ),
        textAlign: isMobile ? TextAlign.center : TextAlign.left,
      ),
    ]
        .addColumn(
          crossAxisAlignment:
              isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
        )
        .addContainer(
          padding: const EdgeInsets.only(left: s16, bottom: s24),
        );
  }
}
