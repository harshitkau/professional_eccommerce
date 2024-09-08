import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prof_ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:prof_ecommerce/features/personalization/controllers/user_controller.dart';
import 'package:prof_ecommerce/utils/constants/image_strings.dart';
import 'package:prof_ecommerce/utils/network_manager/network_manager.dart';
import 'package:prof_ecommerce/utils/popup/full_screen_loader.dart';
import 'package:prof_ecommerce/utils/popup/loders.dart';

class LoginController extends GetxController {
  // local storage
  final localStorage = GetStorage();
  // variables
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final rememberMe = false.obs;
  final hidePassword = true.obs;

  final userController = Get.put(UserController());

  Future<void> emailAndPasswordSignIn() async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDisplay(
          'Logging you in...', TImages.docerAnimation);

      // check internet connection
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (loginFormKey.currentState != null &&
          !loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // // save data if remember me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
        print('${email.text.trim()} and ${password.text.trim()}');
        print('remember me value is $rememberMe');
      }

      // login user using email and password authentication
      await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // remove loader
      TFullScreenLoader.stopLoading();

      // // redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (err) {
      TLoaders.errorSnakbar(title: 'Oh Snap!', message: err.toString());
      TFullScreenLoader.stopLoading();
    }
  }

  // google sign in authentication
  Future<void> googleSignIn() async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDisplay(
          'Logging you in...', TImages.docerAnimation);
      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // google authentication
      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      // save user record
      await userController.saveUserRecord(userCredentials);

      TFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      return TLoaders.errorSnakbar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
