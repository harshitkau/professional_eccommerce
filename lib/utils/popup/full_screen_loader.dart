import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prof_ecommerce/common/widgets/loaders/animation_loader.dart';
import 'package:prof_ecommerce/utils/constants/colors.dart';
import 'package:prof_ecommerce/utils/helpers/helper_functions.dart';

class TFullScreenLoader {
  static void openLoadingDisplay(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: THelperFunctions.isDarkMode(Get.context!)
              ? TColors.dark
              : TColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250),
              TAnimationLoaderWidget(
                text: text,
                animation: animation,
              )
            ],
          ),
        ),
      ),
    );
  }

  // stop the currently open loading dialog
  // this is method doesn't return anything
  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
