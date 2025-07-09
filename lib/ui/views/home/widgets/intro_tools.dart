import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:personal_portfolio/extensions/extensions.dart';
import 'package:personal_portfolio/ui/common/constants.dart';

class IntroTools extends StatelessWidget {
  const IntroTools({super.key});

  @override
  Widget build(BuildContext context) {
    const double iconSize = 32;

    return const <Widget>[
        SvgIcon(
          assetName: kaDart,
          size: iconSize,
          toolName: "Dart",
        ),
        horizontalSpaceLarge,
        SvgIcon(
          assetName: kaFlutter,
          size: iconSize,
          toolName: "Flutter",
        ),
        horizontalSpaceLarge,
        SvgIcon(
          assetName: kaKotlin,
          size: iconSize,
          toolName: "Kotlin",
        ),
        horizontalSpaceLarge,
        SvgIcon(
          assetName: kaPython,
          size: iconSize,
          toolName: "Python",
        ),
      ].addRow();
  }
}

class SvgIcon extends StatelessWidget {
  final String assetName;
  final String toolName;
  final double size;

  const SvgIcon(
      {super.key,
      required this.assetName,
      required this.toolName,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName.removeAssetPrefix(),
      width: size,
      height: size,
      semanticsLabel: assetName,
    );
  }
}
