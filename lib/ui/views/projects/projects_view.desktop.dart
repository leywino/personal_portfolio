import 'package:flutter/material.dart';
import 'package:personal_portfolio/ui/views/coming_soon.dart';

class ProjectsViewDesktop extends StatefulWidget {
  const ProjectsViewDesktop({super.key});

  @override
  State<ProjectsViewDesktop> createState() => _ProjectsViewDesktopState();
}

class _ProjectsViewDesktopState extends State<ProjectsViewDesktop> {
  @override
  Widget build(BuildContext context) {
    return const ComingSoon();
  }
}