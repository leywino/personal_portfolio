import 'package:flutter/scheduler.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_portfolio/ui/views/home/home_viewmodel.dart';

class TestTickerProvider extends Fake implements TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) => Ticker(onTick);
}

void main() {
  group('HomeViewModel Test -', () {
    late HomeViewModel model;
    late TestTickerProvider ticker;

    setUp(() {
      model = HomeViewModel();
      ticker = TestTickerProvider();
    });

    tearDown(() {
      model.dispose();
    });

    test('incrementCounter increases the counter and updates label', () {
      model.incrementCounter();
      expect(model.counterLabel, 'Counter is: 1');
    });

    test('init initializes animation controller and scroll controller', () {
      model.init(ticker);

      expect(model.controller, isNotNull);
      expect(model.scrollController, isNotNull);
      expect(model.controller!.isAnimating, true);
    });

    test('dispose properly disposes controllers', () {
      model.init(ticker);
      model.dispose();

      expect(() => model.controller!.forward(), throwsA(isA<AssertionError>()));
    });
  });
}
