import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:personal_portfolio/extensions/extensions.dart';
import 'package:personal_portfolio/ui/common/constants.dart';
import 'package:personal_portfolio/ui/views/home/sections/about_me_section.dart';
import 'package:personal_portfolio/ui/views/home/sections/footer_section.dart';
import 'package:personal_portfolio/ui/views/home/sections/intro_section.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeViewDesktop extends StatefulWidget {
  const HomeViewDesktop({super.key});

  @override
  State<HomeViewDesktop> createState() => _HomeViewDesktopState();
}

class _HomeViewDesktopState extends State<HomeViewDesktop>
    with TickerProviderStateMixin {
  late final HomeViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = HomeViewModel();
    _viewModel.init(this);
  }

  @override
  Widget build(BuildContext context) {
    log('rebuild desktop');
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: <Widget>[
            IntroSection(viewModel: _viewModel),
            Divider(
              color: kWhite,
              height: 2,
            ),
            const AboutMeSection(),
            const FooterSection(),
          ]
              .addColumn(mainAxisAlignment: MainAxisAlignment.center)
              .addSizedBox(width: context.screenWidth)
              .addSingleChildScrollView(
                  controller: _viewModel.scrollController),
        );
      },
    );
  }
}
