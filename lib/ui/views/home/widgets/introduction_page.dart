import 'package:flutter/material.dart';
import 'package:personal_portfolio/app/app.dart';
import 'package:personal_portfolio/app/app.router.dart';
import 'package:personal_portfolio/ui/common/constant_sizes.dart';
import 'package:personal_portfolio/ui/common/constant_strings.dart';
import 'package:personal_portfolio/ui/common/constants.dart';
import 'package:personal_portfolio/ui/views/home/home_viewmodel.dart';
import 'package:personal_portfolio/ui/views/home/widgets/introducing_job_widget.dart';
import 'package:personal_portfolio/ui/views/home/widgets/introducing_name_widget.dart';
import 'package:personal_portfolio/ui/widgets/custom_button.dart';
import 'package:responsive_builder/responsive_builder.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({
    super.key,
    required HomeViewModel viewModel,
  }) : _viewModel = viewModel;

  final HomeViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    final button = CustomButton(
      onTap: () => stackedRouter.navigateNamed(Routes.unknownView),
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
          IntroducingNameWidget(viewModel: _viewModel),
          if (deviceType == DeviceScreenType.mobile) verticalSpaceLarge,
          const IntroducingJobWidget(),
          verticalSpaceLarge,
          ScreenTypeLayout.builder(
            desktop: (_) => button,
            mobile: (_) => Center(child: button),
          ),
        ],
      ),
    );
  }
}
