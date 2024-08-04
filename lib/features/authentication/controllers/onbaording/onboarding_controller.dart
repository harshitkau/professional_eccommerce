import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prof_ecommerce/features/authentication/screens/login/login_screen.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  // variables
  final pageContoller = PageController();
  Rx<int> currentPageIndex = 0.obs;

  // update the current index when page scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  // jump to the specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageContoller.jumpTo(index);
  }

  // update the current index and jump to the next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      Get.to(() => LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageContoller.jumpToPage(page);
    }
  }

  // update the current index and jump to the last page
  void skipPage() {
    // currentPageIndex.value = 2;
    // pageContoller.jumpTo(2);
    Get.to(() => LoginScreen());
  }
}
