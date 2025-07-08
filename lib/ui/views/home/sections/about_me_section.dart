import 'package:flutter/material.dart';

import 'package:personal_portfolio/ui/common/constants.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceType = getDeviceType(MediaQuery.of(context).size);

    return SizedBox(
      width: deviceType == DeviceScreenType.desktop
          ? kdDesktopMaxContentWidth
          : screenWidth(context),
      height: screenHeight(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: deviceType == DeviceScreenType.desktop
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          Text(
            ksAboutMe,
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: deviceType == DeviceScreenType.desktop
                ? TextAlign.start
                : TextAlign.center,
          ),
          verticalSpaceMedium,
          Text(
            ksAboutMeDescription,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  height: 1.5,
                ),
            textAlign: deviceType == DeviceScreenType.desktop
                ? TextAlign.start
                : TextAlign.center,
          ),
          verticalSpaceLarge,
        ],
      ),
    );
  }
}
