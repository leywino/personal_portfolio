import 'package:flutter/material.dart';
import 'package:personal_portfolio/extensions/layout_adapter_ex.dart';
import 'package:personal_portfolio/extensions/string_ex.dart';
import 'package:personal_portfolio/extensions/widget_ex.dart';
import 'package:personal_portfolio/ui/common/constants.dart';

class FooterCredits extends StatelessWidget {
  const FooterCredits({
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
          Text(
            ksInspiredFrom,
            style: theme.bodyLarge!.copyWith(
                color: kLightGray, fontSize: context.adaptive(14, 16)),
          ),
          verticalSpaceSmall,
          _buildCreditRow(
            name: ksYelwinoo,
            link: ksYelwinooLink,
            theme: theme,
          ),
          verticalSpaceTiny,
          _buildCreditRow(
            name: ksDavid,
            link: ksDavidLink,
            theme: theme,
          ),
        ].addColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min));
  }

  Widget _buildCreditRow({
    required String name,
    required String link,
    required TextTheme theme,
  }) {
    return <Widget>[
      Icon(Icons.star_outline, size: 16, color: kLightGray),
      horizontalSpaceSmall,
      Text(
        name,
        style: theme.bodyMedium!.copyWith(
          color: kLightGray,
        ),
      ),
    ]
        .addRow(mainAxisSize: MainAxisSize.min)
        .addInkWell(onTap: link.launchWebsite);
  }
}
