import 'package:flutter/material.dart';
import 'package:personal_portfolio/ui/views/coming_soon.dart';

class ProjectsViewTablet extends StatefulWidget {
  const ProjectsViewTablet({super.key});

  @override
  State<ProjectsViewTablet> createState() => _ProjectsViewTabletState();
}

class _ProjectsViewTabletState extends State<ProjectsViewTablet> {
  @override
  Widget build(BuildContext context) {
    return const ComingSoon();
  }
}