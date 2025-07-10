import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:personal_portfolio/extensions/extensions.dart';
import 'package:personal_portfolio/ui/views/home/sections/about_me_section.dart';
import 'package:personal_portfolio/ui/views/home/sections/footer_section.dart';
import 'package:personal_portfolio/ui/views/home/sections/intro_section.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeViewTablet extends StatefulWidget {
  const HomeViewTablet({super.key});

  @override
  State<HomeViewTablet> createState() => _HomeViewTabletState();
}

class _HomeViewTabletState extends State<HomeViewTablet> {
  late final HomeViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = HomeViewModel();
    _viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    log('rebuild tablet');
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: <Widget>[
            IntroSection(viewModel: _viewModel),
            const AboutMeSection(),
            FooterSection(
              viewModel: _viewModel,
            ),
          ]
              .addColumn(mainAxisAlignment: MainAxisAlignment.center)
              .addSizedBox(width: context.screenWidth)
              .addScrollView(
                  physics: const ClampingScrollPhysics(),
                  controller: _viewModel.scrollController),
        );
      },
    );
  }
}
