import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:prof_ecommerce/data/repositories/authentication_repository.dart';
import 'package:prof_ecommerce/data/user/user_repository.dart';
import 'package:prof_ecommerce/features/authentication/models/user_model.dart';
import 'package:prof_ecommerce/features/authentication/screens/signup/verify_email.dart';
import 'package:prof_ecommerce/utils/constants/image_strings.dart';
import 'package:prof_ecommerce/utils/network_manager/network_manager.dart';
import 'package:prof_ecommerce/utils/popup/full_screen_loader.dart';
import 'package:prof_ecommerce/utils/popup/loders.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  // variable
  final hidePassword = true.obs;
  final privacyPolicyChecker = false.obs;

  final email = TextEditingController();
  final lastName = TextEditingController();
  final firstName = TextEditingController();
  final userName = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // signup
  Future<void> signup() async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDisplay(
          'We are processing your information...', TImages.docerAnimation);

      // check internet connection

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // privacy policy check
      if (!privacyPolicyChecker.value) {
        TLoaders.warningSnakbar(
          title: 'Accept Privacy Policy',
          message:
              'In order to create account, you must to read and accept the Privacy Policy & Terms of use',
        );
        return;
      }

      // register user in the firebase authentication & save user data in the firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // save authenticated user data in the firebase firestore
      final newuser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newuser);

      // remove loader
      TFullScreenLoader.stopLoading();

      // show success message
      TLoaders.successSnakbar(
          title: 'Congratulations',
          message: 'Your account has been created, Verify email to continue');

      // move verify screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (err) {
      TLoaders.errorSnakbar(title: 'Oh Snap!', message: err.toString());
      TFullScreenLoader.stopLoading();
    }
  }
}
