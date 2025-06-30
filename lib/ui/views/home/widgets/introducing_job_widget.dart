import 'package:flutter/material.dart';
import 'package:personal_portfolio/ui/common/constant_strings.dart';
import 'package:responsive_builder/responsive_builder.dart';

class IntroducingJobWidget extends StatelessWidget {
  const IntroducingJobWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$ksIamA $ksFlutterDev",
      style: getValueForScreenType<TextStyle>(
        context: context,
        desktop: Theme.of(context).textTheme.displayMedium!,
        mobile: Theme.of(context).textTheme.displaySmall!,
      ),
      textAlign: getValueForScreenType<TextAlign>(
        context: context,
        desktop: TextAlign.start,
        mobile: TextAlign.center,
      ),
    );
  }
}
