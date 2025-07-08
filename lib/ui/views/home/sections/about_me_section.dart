import 'package:flutter/material.dart';
import 'package:personal_portfolio/app/app.dart';
import 'package:personal_portfolio/app/app.router.dart';
import 'package:personal_portfolio/extensions/extensions.dart';

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ksAboutMe,
            style: getValueForScreenType<TextStyle?>(
                context: context,
                mobile: Theme.of(context).textTheme.displaySmall,
                desktop: Theme.of(context).textTheme.displayMedium),
            textAlign: deviceType == DeviceScreenType.desktop
                ? TextAlign.start
                : TextAlign.center,
          ),
          verticalSpaceMedium,
          Text(
            ksAboutMeDescription,
            style: getValueForScreenType<TextStyle?>(
                context: context,
                mobile: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 13),
                tablet: Theme.of(context).textTheme.bodyLarge,
                desktop: Theme.of(context).textTheme.bodyLarge),
            textAlign: TextAlign.start,
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
      ).addPadding(
        edgeInsets: EdgeInsetsGeometry.all(
          getValueForScreenType<double>(
            context: context,
            mobile: screenWidth(context) * 0.05,
            tablet: screenWidth(context) * 0.1,
            desktop: 0,
          ),
        ),
      ),
    );
  }
}
