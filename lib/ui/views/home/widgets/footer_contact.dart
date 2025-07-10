import 'package:flutter/material.dart';
import 'package:personal_portfolio/extensions/extensions.dart';
import 'package:personal_portfolio/ui/common/constants.dart';

class FooterContact extends StatelessWidget {
  const FooterContact({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final kLightGrayTextStyle = TextStyle(
      fontFamily: "JetBrainsMono",
      color: kLightGray,
    );

    return DefaultTextStyle(
      style: kLightGrayTextStyle,
      child: <Widget>[
        Text(ksContactInfo,
            style: theme.bodyLarge!.copyWith(
                color: kLightGray, fontSize: context.adaptive(14, 16))),
        _buildContactRow(
          icon: Icons.mail_outline,
          text: ksEmail,
          onTap: ksEmail.launchEmail,
          theme: theme,
          context: context,
        ),
        _buildContactRow(
          icon: Icons.phone_outlined,
          text: ksPhone,
          onTap: null,
          theme: theme,
          context: context,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Wrap(
            spacing: 12,
            children: ksSocialMedia.map((media) {
              return IconButton(
                onPressed: media.link.launchWebsite,
                icon: media.icon,
                color: kLightGray,
                splashRadius: 20,
              );
            }).toList(),
          ),
        ),
      ].addColumn(
          crossAxisAlignment: context.adaptive(
              CrossAxisAlignment.start, CrossAxisAlignment.start),
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min),
    );
  }

  Widget _buildContactRow({
    required IconData icon,
    required String text,
    void Function()? onTap,
    required TextTheme theme,
    required BuildContext context,
  }) {
    final row = <Widget>[
      Icon(icon, color: kLightGray, size: 18),
      horizontalSpaceSmall,
      SelectableText(
        text,
        style: theme.bodyMedium!.copyWith(color: kLightGray),
      ),
    ].addRow(
      mainAxisSize: MainAxisSize.min,
    );

    return onTap != null ? row.addInkWell(onTap: onTap) : row;
  }
}
