import 'package:flutter/material.dart';
import 'package:personal_portfolio/ui/views/wrapper.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';


import 'projects_view.desktop.dart';
import 'projects_view.tablet.dart';
import 'projects_view.mobile.dart';
import 'projects_viewmodel.dart';

class ProjectsView extends StackedView<ProjectsViewModel> {
  const ProjectsView({super.key});

  @override
  Widget builder(
    BuildContext context,
    ProjectsViewModel viewModel,
    Widget? child,
  ) {
    return Wrapper(
      page: ScreenTypeLayout.builder(
        mobile: (_) => const ProjectsViewMobile(),
        tablet: (_) => const ProjectsViewTablet(),
        desktop: (_) => const ProjectsViewDesktop(),
      ),
    );
  }

  @override
  ProjectsViewModel viewModelBuilder(BuildContext context) =>
      ProjectsViewModel();
}
