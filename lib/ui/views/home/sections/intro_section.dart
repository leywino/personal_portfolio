import 'package:flutter/material.dart';

import 'package:personal_portfolio/ui/common/constants.dart';
import 'package:personal_portfolio/ui/views/home/home_viewmodel.dart';
import 'package:personal_portfolio/ui/views/home/widgets/intro_job.dart';
import 'package:personal_portfolio/ui/views/home/widgets/intro_name.dart';
import 'package:personal_portfolio/ui/views/home/widgets/intro_socials.dart';
import 'package:personal_portfolio/ui/widgets/custom_button.dart';
import 'package:responsive_builder/responsive_builder.dart';

class IntroSection extends StatelessWidget {
  const IntroSection({
    super.key,
    required HomeViewModel viewModel,
  }) : _viewModel = viewModel;

  final HomeViewModel _viewModel;

  goToAboutMe(BuildContext context) {
    _viewModel.scrollController!.animateTo(
      screenHeight(context),
      duration: duration500,
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final button = CustomButton(
      onTap: () => goToAboutMe(context),
      text: ksKnowMore,
    );
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    bool isLessThan1300() {
      return screenWidth(context) < 1300;
    }

    return SizedBox(
      width: deviceType == DeviceScreenType.desktop
          ? kdDesktopMaxContentWidth
          : screenWidth(context),
      height: deviceType == DeviceScreenType.desktop
          ? kdDesktopMaxContentHeight
          : screenHeight(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: isLessThan1300()
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          IntroName(viewModel: _viewModel),
          if (deviceType == DeviceScreenType.mobile) verticalSpaceLarge,
          const IntroJob(),
          verticalSpaceLarge,
          ScreenTypeLayout.builder(
            desktop: (_) => button,
            mobile: (_) => Center(child: button),
          ),
          verticalSpaceMassive,
          IntroSocials(viewModel: _viewModel),
        ],
      ),
    );
  }
}
