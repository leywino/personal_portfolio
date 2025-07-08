import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  AnimationController? controller;
  ScrollController? scrollController;
  bool _isDisposed = false;

  void init(TickerProvider ticker) {
    log("homeviewmodel init");
    _isDisposed = false;
    controller = AnimationController(
      vsync: ticker,
      duration: const Duration(seconds: 2),
    );
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    if (_isDisposed) return;
    controller?.dispose();
    scrollController?.dispose();
    _isDisposed = true;
    log("homeviewmodel disposed");
    super.dispose();
  }
}
