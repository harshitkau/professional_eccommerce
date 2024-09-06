import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:prof_ecommerce/data/user/user_repository.dart';
import 'package:prof_ecommerce/features/personalization/controllers/user_controller.dart';
import 'package:prof_ecommerce/features/personalization/screens/profile/profile.dart';
import 'package:prof_ecommerce/utils/constants/image_strings.dart';
import 'package:prof_ecommerce/utils/network_manager/network_manager.dart';
import 'package:prof_ecommerce/utils/popup/full_screen_loader.dart';
import 'package:prof_ecommerce/utils/popup/loders.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());

  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  // fetch user record
  Future<void> intilizeName() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
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
      if (updateUserNameFormKey.currentState != null &&
          !updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // update user's first & last name in the firebase firestore
      Map<String, dynamic> name = {
        'firstName': firstName.text.trim(),
        'lastName': lastName.text.trim()
      };
      await userRepository.updateSingleFeild(name);

      // update the rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // remove loader
      TFullScreenLoader.stopLoading();

      // show success message
      TLoaders.successSnakbar(
          title: 'Congratulations', message: 'Your Name has been updated');

      Get.off(() => const ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnakbar(title: 'Oh Snap!', message: e.toString());
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    intilizeName();
  }
}
