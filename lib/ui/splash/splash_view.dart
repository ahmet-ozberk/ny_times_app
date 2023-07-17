import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ny_times_app/app/animations/app_slide_animation.dart';
import 'package:ny_times_app/app/constants/string_constant.dart';
import 'package:ny_times_app/app/extensions/context_extension.dart';
import 'package:ny_times_app/services/navigate_services.dart';
import 'package:ny_times_app/ui/home/home_view.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  void initFunction() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigate.toRemove(const HomeView(), isFadeAnimation: true);
    });
  }

  @override
  void initState() {
    super.initState();
    initFunction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppSlideAnimation(
        curve: Curves.bounceOut,
        duration: const Duration(milliseconds: 1600),
        value: context.height * 0.5,
        child: Center(
          child: Text(
            SC.appTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
    );
  }
}
