import 'package:flutter/material.dart';
import 'package:personal_portfolio/ui/common/app_colors.dart';
import 'package:personal_portfolio/ui/common/app_constants.dart';
import 'package:personal_portfolio/ui/common/app_strings.dart';
import 'package:personal_portfolio/ui/common/ui_helpers.dart';
import 'package:personal_portfolio/ui/widgets/animated_text_slide_box_transition.dart';
import 'package:personal_portfolio/ui/widgets/custom_button.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeViewDesktop extends StatefulWidget {
  const HomeViewDesktop({super.key});

  @override
  State<HomeViewDesktop> createState() => _HomeViewDesktopState();
}

class _HomeViewDesktopState extends State<HomeViewDesktop>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: duration3000,
    )..forward();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Center(
            child: SizedBox(
              width: kdDesktopMaxContentWidth,
              height: kdDesktopMaxContentHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(ksHiMyNameIs,
                          style: Theme.of(context).textTheme.displayMedium),
                      horizontalSpaceMassive,
                      AnimatedTextSlideBoxTransition(
                        boxColor: kWhite,
                        controller: _controller,
                        coverColor: Theme.of(context).scaffoldBackgroundColor,
                        text: ksRealName,
                        textStyle: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                fontWeight: FontWeight.bold, color: kCoralPink),
                      ),
                    ],
                  ),
                  Text("$ksIamA $ksFlutterDev",
                      style: Theme.of(context).textTheme.displayMedium),
                  verticalSpaceLarge,
                  CustomButton(
                    onTap: () {},
                    text: "Know More",
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
