import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prof_ecommerce/features/authentication/screens/onboarding/onboarding.dart';
import 'package:prof_ecommerce/utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: const OnBoardingScreen(),
    );
  }
}
