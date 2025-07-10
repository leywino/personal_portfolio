import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  ScrollController? scrollController;
  bool _isDisposed = false;

  void init() {
    log("homeviewmodel init");
    _isDisposed = false;
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    if (_isDisposed) return;
    scrollController?.dispose();
    _isDisposed = true;
    log("homeviewmodel disposed");
    super.dispose();
  }
}
