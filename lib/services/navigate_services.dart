import 'package:flutter/material.dart';

typedef Navigate = NavigationService;

class NavigationService {
  static GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
  static final BuildContext context = navigationKey.currentContext!;

  static Future<dynamic> to(Widget route, {bool isFadeAnimation = false}) {
    return navigationKey.currentState!.push(isFadeAnimation
        ? FadePageRoute(route)
        : MaterialPageRoute(builder: (context) => route));
  }

  static Future<dynamic> toRemove(Widget route,
      {bool isFadeAnimation = false}) {
    return navigationKey.currentState!.pushAndRemoveUntil(
        isFadeAnimation
            ? FadePageRoute(route)
            : MaterialPageRoute(builder: (context) => route),
        (route) => false);
  }

  static void back({Object? result}) {
    return navigationKey.currentState!.pop(result);
  }
}

class FadePageRoute<T> extends PageRoute<T> {
  FadePageRoute(this.child);
  @override
  Color get barrierColor => Theme.of(Navigate.context).primaryColor;

  @override
  String get barrierLabel => "";

  final Widget child;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 100);
}