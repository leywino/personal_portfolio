import 'package:flutter/material.dart';

import 'package:responsive_builder/responsive_builder.dart';
import 'package:personal_portfolio/ui/common/constants.dart';

class IntroJob extends StatelessWidget {
  const IntroJob({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$ksIamA $ksFlutterDev",
      style: getValueForScreenType<TextStyle>(
          context: context,
          desktop: Theme.of(context).textTheme.displayMedium!,
          mobile:
              Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 22),
          tablet:
              Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 32)),
      textAlign: TextAlign.start,
    );
  }
}
