import 'package:flutter/material.dart';
import 'package:personal_portfolio/ui/views/wrapper.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'home_view.desktop.dart';
import 'home_view.tablet.dart';
import 'home_view.mobile.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key, this.refresh = false});

  final bool refresh;

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Wrapper(
      page: ScreenTypeLayout.builder(
        mobile: (_) => const HomeViewMobile(),
        tablet: (_) => const HomeViewTablet(),
        desktop: (_) => const HomeViewDesktop(),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
