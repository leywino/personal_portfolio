import 'package:flutter/material.dart';
import 'package:personal_portfolio/extensions/widget_ex.dart';

import 'package:personal_portfolio/ui/common/constants.dart';
import 'package:personal_portfolio/ui/views/home/home_viewmodel.dart';
import 'package:personal_portfolio/ui/views/home/widgets/intro_job.dart';
import 'package:personal_portfolio/ui/views/home/widgets/intro_name.dart';
import 'package:personal_portfolio/ui/views/home/widgets/intro_socials.dart';
import 'package:personal_portfolio/ui/views/home/widgets/intro_tools.dart';
import 'package:personal_portfolio/ui/widgets/custom_button.dart';
import 'package:responsive_builder/responsive_builder.dart';

class IntroSection extends StatefulWidget {
  const IntroSection({
    super.key,
    required HomeViewModel viewModel,
  }) : _viewModel = viewModel;

  final HomeViewModel _viewModel;

  @override
  State<IntroSection> createState() => _IntroSectionState();
}

class _IntroSectionState extends State<IntroSection>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isDisposed = false;

  goToAboutMe(BuildContext context) {
    widget._viewModel.scrollController!.animateTo(
      screenHeight(context),
      duration: duration500,
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    super.initState();
  }

  @override
  void dispose() {
    if (_isDisposed) return;
    _isDisposed = true;
    _animationController.dispose();
    super.dispose();
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

    return <Widget>[
      IntroName(animationController: _animationController),
      if (deviceType == DeviceScreenType.mobile) verticalSpaceLarge,
      const IntroJob(),
      verticalSpaceLarge,
      button,
      verticalSpaceMassive,
      IntroSocials(animationController: _animationController),
      verticalSpaceMassive,
      const IntroTools()
    ]
        .addColumn(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
        )
        .addPadding(
          edgeInsets: getValueForScreenType<EdgeInsetsGeometry>(
            context: context,
            mobile: EdgeInsetsGeometry.only(
              left: screenWidth(context) * 0.05,
            ),
            tablet: EdgeInsetsGeometry.only(left: screenWidth(context) * 0.1),
            desktop: isLessThan1300()
                ? EdgeInsetsGeometry.only(left: screenWidth(context) * 0.075)
                : EdgeInsets.zero,
          ),
        )
        .addSizedBox(
          width: deviceType == DeviceScreenType.desktop
              ? kdDesktopMaxContentWidth
              : screenWidth(context),
          height: screenHeight(context),
        );
  }
}
