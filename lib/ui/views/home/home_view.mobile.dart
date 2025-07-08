import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:personal_portfolio/extensions/extensions.dart';
import 'package:personal_portfolio/ui/views/home/sections/about_me_section.dart';
import 'package:personal_portfolio/ui/views/home/sections/footer_section.dart';
import 'package:personal_portfolio/ui/views/home/sections/intro_section.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeViewMobile extends StatefulWidget {
  const HomeViewMobile({super.key});

  @override
  State<HomeViewMobile> createState() => _HomeViewMobileState();
}

class _HomeViewMobileState extends State<HomeViewMobile>
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
    log('rebuild mobile');
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: SingleChildScrollView(
            controller: _viewModel.scrollController,
            child: SizedBox(
              width: context.screenWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IntroSection(viewModel: _viewModel),
                  const AboutMeSection(),
                  const FooterSection(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
