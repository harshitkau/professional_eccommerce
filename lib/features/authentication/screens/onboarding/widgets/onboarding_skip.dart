import 'package:flutter/material.dart';
import 'package:prof_ecommerce/features/authentication/controllers/onbaording/onboarding_controller.dart';
import 'package:prof_ecommerce/utils/device/device_utility.dart';

import '../../../../../utils/constants/sizes.dart';

class onBoardingSkip extends StatelessWidget {
  const onBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: TDeviceUtils.getAppBarHeight(),
        right: TSizes.defaultSpace,
        child: TextButton(
          onPressed: () => OnBoardingController.instance.skipPage(),
          child: Text("Skip"),
        ));
  }
}
