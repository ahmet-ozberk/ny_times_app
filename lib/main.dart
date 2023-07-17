import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ny_times_app/app/constants/string_constant.dart';
import 'package:ny_times_app/services/navigate_services.dart';
import 'package:ny_times_app/ui/splash/splash_view.dart';

void main() => runApp(const ProviderScope(child: NyTimesApp()));

class NyTimesApp extends StatelessWidget {
  const NyTimesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        title: SC.appTitle,
        debugShowCheckedModeBanner: false,
        navigatorKey: Navigate.navigationKey,
        theme: ThemeData(useMaterial3: true),
        home: const SplashView(),
      ),
    );
  }
}
