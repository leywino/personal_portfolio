import 'package:flutter/animation.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  AnimationController? controller;

  int _counter = 0;
  bool _isDisposed = false;

  String get counterLabel => 'Counter is: $_counter';

  void init(TickerProvider ticker) {
    _isDisposed = true;
    controller = AnimationController(
      vsync: ticker,
      duration: const Duration(seconds: 2),
    )..forward();
  }

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  @override
  void dispose() {
    if (_isDisposed) return;
    controller?.dispose();
    super.dispose();
  }
}
