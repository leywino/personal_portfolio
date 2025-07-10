import 'package:flutter/material.dart';
import 'package:personal_portfolio/extensions/extensions.dart';
import 'package:personal_portfolio/ui/common/constants.dart';
import 'package:personal_portfolio/ui/views/home/home_viewmodel.dart';
import 'package:personal_portfolio/ui/views/home/widgets/footer_contact.dart';
import 'package:personal_portfolio/ui/views/home/widgets/footer_credits.dart';
import 'package:personal_portfolio/ui/views/home/widgets/footer_cta.dart';
import 'package:personal_portfolio/ui/views/home/widgets/footer_signature.dart';
import 'package:personal_portfolio/ui/widgets/custom_slider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';

class FooterSection extends StatefulWidget {
  const FooterSection({super.key, required HomeViewModel viewModel})
      : _viewModel = viewModel;

  final HomeViewModel _viewModel;

  @override
  State<FooterSection> createState() => _FooterSectionState();
}

class _FooterSectionState extends State<FooterSection>
    with TickerProviderStateMixin {
  late AnimationController _sliderController;
  late AnimationController _textController;
  final List<Interval> _sliderIntervals = [];
  double _footerHeight = 250;
  bool _isDisposed = false;
  DeviceScreenType deviceType = DeviceScreenType.desktop;

  @override
  void initState() {
    super.initState();
    _sliderController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    for (int i = 0; i < 5; i++) {
      final start = Duration(milliseconds: 100 * i);
      final end = start + const Duration(milliseconds: 800);
      _sliderIntervals.add(
        Interval(
          start.inMilliseconds / 2000,
          end.inMilliseconds / 2000,
        ),
      );
    }
  }

  @override
  void dispose() {
    if (_isDisposed) return;
    _isDisposed = true;
    _textController.dispose();
    _sliderController.dispose();
    super.dispose();
  }

  void _startAnimation() async {
    if (_isDisposed) return;
    _sliderController.forward();
    await Future.delayed(duration1000);
    if (_isDisposed) return;
    _textController.forward();
  }

  void _scrollToUp() {
    widget._viewModel.scrollController!.animateTo(
      0,
      duration: duration500,
      curve: Curves.easeInOut,
    );
  }

  void _resetControllers() {
    _sliderController.reset();
    _textController.reset();
  }

  Widget _buildMobileLayout() {
    return <Widget>[
      verticalSpaceLarge,
      const FooterContact(),
      // const FooterCredits(), // You can enable if needed
      _buildFooterSignature(),
    ].addColumn(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }

  Widget _buildTabletNarrowLayout() {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        _buildMainRow(),
        _buildFooterSignature()
            .addPadding(edgeInsets: const EdgeInsets.only(left: s16)),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Stack(
      alignment: Alignment.center,
      children: [
        _buildMainRow(),
        _buildFooterSignature(),
      ],
    );
  }

  Widget _buildMainRow() {
    return <Widget>[
      _buildFooterCTA(),
      _buildFooterContact(),
    ].addRow(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  Widget _buildFooterContact() {
    return <Widget>[
      const FooterContact(),
      const FooterCredits(),
    ]
        .addColumn(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
        )
        .addPadding(edgeInsets: const EdgeInsets.only(right: s16));
  }

  Widget _buildFooterCTA() {
    return FooterCTA(
      deviceType: deviceType,
      textController: _textController,
    );
  }

  Widget _buildFooterSignature() {
    return FooterSignature(
      scrollToUp: _scrollToUp,
      textController: _textController,
    );
  }

  Widget _buildChildren() {
    deviceType = getDeviceType(MediaQuery.of(context).size);
    final isMobile = deviceType == DeviceScreenType.mobile;
    final isTablet = deviceType == DeviceScreenType.tablet;

    if (isMobile) {
      return _buildMobileLayout();
    } else if (isTablet && screenWidth(context) < 760) {
      return _buildTabletNarrowLayout();
    } else {
      return _buildDesktopLayout();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (deviceType == DeviceScreenType.tablet) {
      _footerHeight = screenHeight(context) * 0.3;
    } else if (deviceType == DeviceScreenType.mobile) {
      _footerHeight = 270;
    }
    return VisibilityDetector(
      key: const ValueKey("footer_section"),
      onVisibilityChanged: (info) {
        if (!context.mounted) return;
        if (info.visibleFraction > 0.5) {
          _startAnimation();
        } else {
          if (_sliderController.isCompleted || _sliderController.value == 1.0) {
            _resetControllers();
          }
        }
      },
      child: DefaultTextStyle(
        style: TextStyle(
            color: kLightGray,
            fontFamily: "NotoSans",
            fontFamilyFallback: const ["NotoSans", "NotoColorEmoji"]),
        child: <Widget>[
          ...List.generate(
            5,
            (index) => CustomSlider(
              width: screenWidth(context),
              height: _footerHeight,
              animation: _sliderController,
              interval: _sliderIntervals[index],
              color: kDarkSlate,
              isForward: true,
            ),
          ),
          _buildChildren().addSizedBox(width: screenWidth(context)),
        ].addStack(),
      ).addContainer(
        color: kLightGray,
        height: _footerHeight,
        width: screenWidth(context),
      ),
    );
  }
}
