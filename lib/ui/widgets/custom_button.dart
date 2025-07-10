import 'package:flutter/material.dart';
import 'package:personal_portfolio/ui/widgets/mouse_transforms/scale_on_hover.dart';
import 'package:personal_portfolio/ui/widgets/mouse_transforms/translate_on_hover.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CustomButton extends StatefulWidget {
  final VoidCallback onTap;
  final String text;
  final Color defaultBackgroundColor;
  final Color defaultBorderColor;
  final Color defaultTextColor;
  final Color defaultBoxShadowColor;
  final Color hoverBackgroundColor;
  final Color hoverTextColor;
  final double scaleOnHover;
  final double translateYOnHover;

  const CustomButton({
    super.key,
    required this.onTap,
    this.text = 'Button',
    this.defaultBackgroundColor = const Color(0xFF56595B),
    this.defaultBorderColor = const Color(0xFFF4806D),
    this.defaultTextColor = const Color(0xFFF4806D),
    this.defaultBoxShadowColor = const Color(0xFFF4806D),
    this.hoverBackgroundColor = const Color(0xFFF4806D),
    this.hoverTextColor = const Color(0xFFD8D8D8),
    this.scaleOnHover = 1.03,
    this.translateYOnHover = -5.0,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final textStyle = getValueForScreenType<TextStyle>(
      context: context,
      desktop: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      mobile: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );

    final padding = getValueForScreenType<EdgeInsets>(
      context: context,
      desktop: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
      tablet: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      mobile: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: TranslateOnHover(
          y: widget.translateYOnHover,
          child: ScaleOnHover(
            scale: widget.scaleOnHover,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              padding: padding,
              decoration: BoxDecoration(
                color: _isHovering
                    ? widget.hoverBackgroundColor
                    : widget.defaultBackgroundColor,
                // borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: _isHovering
                      ? widget.hoverBackgroundColor
                      : widget.defaultBorderColor,
                  width: 2,
                ),
                boxShadow: _isHovering
                    ? null
                    : [
                        BoxShadow(
                          color: widget.defaultBoxShadowColor,
                          offset: const Offset(-4, 4),
                          blurRadius: 0,
                          spreadRadius: 0,
                        ),
                      ],
              ),
              child: Text(
                widget.text,
                style: textStyle.copyWith(
                  color: _isHovering
                      ? widget.hoverTextColor
                      : widget.defaultTextColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
