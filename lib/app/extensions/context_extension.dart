import 'package:flutter/material.dart';

import '../../services/navigate_services.dart';

extension ContextExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  double dynamicHeight(double value) => width * value;
  double dynamicWidth(double value) => height * value;
  double get safeAreaBottom => MediaQuery.of(this).padding.bottom;
  double get safeAreaTop => MediaQuery.of(this).padding.top;
  SizedBox get safeAreaTopWidget =>
      SizedBox(height: MediaQuery.of(this).padding.top);
  SizedBox get safeAreaBottomWidget =>
      SizedBox(height: MediaQuery.of(this).padding.bottom);

  Future<dynamic> to(Widget route, {bool isFadeAnimation = false}) {
    return Navigate.to(route, isFadeAnimation: isFadeAnimation);
  }

  Future<dynamic> toRemove(Widget route, {bool isFadeAnimation = false}) {
    return Navigate.toRemove(route, isFadeAnimation: isFadeAnimation);
  }

  void back({Object? result}) {
    return Navigate.back(result: result);
  }
}
