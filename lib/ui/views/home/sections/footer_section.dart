import 'package:flutter/material.dart';
import 'package:personal_portfolio/ui/common/constants.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kDarkSlate,
      height: screenHeight(context) / 2,
      width: screenWidth(context),
      child: DefaultTextStyle(
        style: TextStyle(
          color: kLightGray,
        ),
        child: const Text("hi"),
      ),
    );
  }
}
