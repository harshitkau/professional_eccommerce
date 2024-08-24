import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prof_ecommerce/bindings/general_binding.dart';
// import 'package:prof_ecommerce/features/authentication/screens/onboarding/onboarding.dart';
import 'package:prof_ecommerce/utils/constants/colors.dart';
import 'package:prof_ecommerce/utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,

      initialBinding: GeneralBindings(),
      // show loader or circular progress indicator meanwhile authentication repositories is deciding to show the relevent screen
      home: const Scaffold(
        backgroundColor: TColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
