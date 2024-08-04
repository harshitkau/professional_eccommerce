import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:prof_ecommerce/features/authentication/controllers/onbaording/onboarding_controller.dart';
import 'package:prof_ecommerce/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:prof_ecommerce/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:prof_ecommerce/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:prof_ecommerce/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:prof_ecommerce/utils/constants/image_strings.dart';
import 'package:prof_ecommerce/utils/constants/text_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          // horizontal scrolling page
          PageView(
            controller: controller.pageContoller,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              onBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subTitle: TTexts.onBoardingSubTitle1,
              ),
              onBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubTitle2,
              ),
              onBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          // skip button
          const onBoardingSkip(),

          // Dot Navigation smoothpage indicator
          const OnBoardingDotNavigation(),

          // circular button
          OnBoardingNextButton()
        ],
      ),
    );
  }
}
