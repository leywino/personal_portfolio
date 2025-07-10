import 'dart:math';

import 'package:flutter/material.dart';
import 'package:personal_portfolio/extensions/extensions.dart';
import 'package:personal_portfolio/ui/common/constants.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key? key,
    required this.onPressed,
    this.hasMenuTapped = false,
  }) : super(key: key);
  final VoidCallback onPressed;
  final bool hasMenuTapped;
  @override
  Widget build(BuildContext context) {
    double size = context.adaptive<double>(
      s30,
      s65,
    );
    double difference = context.adaptive<double>(
      s5,
      s20,
    );
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationY(pi),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(s50),
        child: Icon(
          hasMenuTapped ? Icons.close_outlined : Icons.menu_outlined,
          size: size - difference,
          color: kWhite,
        ).addCenter().addContainer(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              width: size,
              height: size,
            ),
      ),
    );
  }
}
