import 'package:flutter/material.dart';
import 'package:personal_portfolio/extensions/extensions.dart';
import 'package:personal_portfolio/ui/common/constants.dart';
import 'package:personal_portfolio/ui/widgets/animated_text_slide_box_transition.dart';

class FooterSignature extends StatelessWidget {
  const FooterSignature(
      {super.key,
      required this.scrollToUp,
      required this.textController,
   })
     ;

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
      const Spacer(),
      <Widget>[
        AnimatedTextSlideBoxTransition(
          controller: textController,
          text: ksMadeWith,
          textStyle: Theme.of(context).textTheme.bodyMedium,
          boxColor: kLightGray,
          coverColor: kDarkSlate,
        ),
        horizontalSpaceSmall,
        Icon(
          Icons.favorite_rounded,
          color: kLightGray,
          size: 20,
        )
      ].addRow(mainAxisAlignment: MainAxisAlignment.center),
      verticalSpaceTiny,
      const Text(ksCC),
      verticalSpaceMedium,
    ].addColumn(mainAxisSize: MainAxisSize.max);
  }
}
