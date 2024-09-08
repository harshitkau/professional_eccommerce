import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:prof_ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:prof_ecommerce/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:prof_ecommerce/utils/constants/image_strings.dart';
import 'package:prof_ecommerce/utils/network_manager/network_manager.dart';
import 'package:prof_ecommerce/utils/popup/full_screen_loader.dart';
import 'package:prof_ecommerce/utils/popup/loders.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();

  // variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  // send reset password email
  sendPasswordEmail() async {
    try {
      //start loading
      TFullScreenLoader.openLoadingDisplay(
          'Processing Your Request...', TImages.docerAnimation);

      // checl internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (forgetPasswordFormKey.currentState != null &&
          !forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      // remove loader
      TFullScreenLoader.stopLoading();

      TLoaders.successSnakbar(
          title: 'Email Sent',
          message: 'Email Link Sent to Reset your Password'.tr);

      // redirect

      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnakbar(title: 'Oh Snap', message: e.toString());
    }
  }

  resendPasswordEmail(String email) async {
    try {
      //start loading
      TFullScreenLoader.openLoadingDisplay(
          'Processing Your Request...', TImages.docerAnimation);

      // checl internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // remove loader
      TFullScreenLoader.stopLoading();

      TLoaders.successSnakbar(
          title: 'Email Sent',
          message: 'Email Link Sent to Reset your Password'.tr);
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnakbar(title: 'Oh Snap', message: e.toString());
    }
  }
}
