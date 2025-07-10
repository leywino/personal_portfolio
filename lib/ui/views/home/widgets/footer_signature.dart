import 'package:flutter/material.dart';
import 'package:personal_portfolio/extensions/extensions.dart';
import 'package:personal_portfolio/ui/common/constants.dart';
import 'package:personal_portfolio/ui/widgets/animated_text_slide_box_transition.dart';

class FooterSignature extends StatelessWidget {
  const FooterSignature({
    super.key,
    required this.scrollToUp,
    required this.textController,
  });

  final Function()? scrollToUp;
  final AnimationController textController;

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      IconButton(
        onPressed: scrollToUp,
        icon: Icon(
          Icons.keyboard_arrow_up,
          color: kLightGray,
        ),
      ),
      <Widget>[
        <Widget>[
          AnimatedTextSlideBoxTransition(
            controller: textController,
            text: ksMadeWith,
            textStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: context.adaptive(8, 12, tablet: 8)),
            boxColor: kLightGray,
            coverColor: kDarkSlate,
          ),
          horizontalSpaceSmall,
          Icon(
            Icons.favorite_rounded,
            color: kLightGray,
            size: context.adaptive(12, 20, tablet: 16),
          )
        ].addRow(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min),
        verticalSpaceTiny,
        Text(ksCC,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: context.adaptive(8, 12, tablet: 8))),
        verticalSpaceMedium
      ].addColumn(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center),
    ].addColumn(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween);
  }
}
