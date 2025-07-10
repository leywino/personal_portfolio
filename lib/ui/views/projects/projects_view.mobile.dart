import 'package:flutter/material.dart';
import 'package:personal_portfolio/ui/views/coming_soon.dart';

class ProjectsViewMobile extends StatefulWidget {
  const ProjectsViewMobile({super.key});

  @override
  State<ProjectsViewMobile> createState() => _ProjectsViewMobileState();
}

class _ProjectsViewMobileState extends State<ProjectsViewMobile> {
  @override
  Widget build(BuildContext context) {
    return const ComingSoon();
  }
}