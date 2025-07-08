import 'package:flutter/material.dart';
import 'package:personal_portfolio/app/app.dart';
import 'package:personal_portfolio/app/app.router.dart';

import 'package:personal_portfolio/ui/common/constants.dart';
import 'package:personal_portfolio/ui/widgets/custom_button.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

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
          CustomButton(
            onTap: () {
              stackedRouter.replace(getRouteWithRouteName(Routes.projectsView));
            },
            text: ksViewProjects,
            defaultBorderColor: kWhite,
            defaultBoxShadowColor: kWhite,
            defaultTextColor: kWhite,
            hoverBackgroundColor: kWhite,
            hoverTextColor: kPrimary,
          )
        ],
      ),
    );
  }
}
