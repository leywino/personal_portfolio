import 'package:flutter/material.dart';
import 'package:personal_portfolio/ui/common/constant_sizes.dart';

class AboutMePage extends StatefulWidget {
  const AboutMePage({super.key});

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight(context),
    );
  }
}
