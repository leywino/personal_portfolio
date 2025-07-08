import 'package:flutter/material.dart';
import 'package:personal_portfolio/extensions/extensions.dart';
import 'package:personal_portfolio/ui/common/constants.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    double size = context.adaptive<double>(
      s30,
      s40,
    );
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        kaLogo,
        fit: BoxFit.contain,
        width: size,
        height: size,
      ),
    );
  }
}
