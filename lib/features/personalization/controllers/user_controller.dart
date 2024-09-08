import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prof_ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:prof_ecommerce/data/repositories/user/user_repository.dart';
import 'package:prof_ecommerce/features/authentication/models/user_model.dart';
import 'package:prof_ecommerce/features/authentication/screens/login/login_screen.dart';
import 'package:prof_ecommerce/features/personalization/screens/profile/widget/re_auth_user_login_form.dart';
import 'package:prof_ecommerce/utils/constants/image_strings.dart';
import 'package:prof_ecommerce/utils/constants/sizes.dart';
import 'package:prof_ecommerce/utils/popup/full_screen_loader.dart';
import 'package:prof_ecommerce/utils/popup/loders.dart';

import '../../../utils/network_manager/network_manager.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final imageUploading = false.obs;
  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final hidePasswords = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();
  final userRepository = Get.put(UserRepository());

  // save the user record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      // first update rx user and then check if user data is already stored. if not stored new data
      await fetchUserRecord();

      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          final nameParts =
              UserModel.nameParts(userCredential.user!.displayName ?? "");

          final userName = UserModel.generateUserName(
              userCredential.user!.displayName ?? "");
          final user = UserModel(
            id: userCredential.user!.uid,
            userName: userName,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            email: userCredential.user!.email ?? '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            profilePicture: userCredential.user!.photoURL ?? '',
          );

          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      TLoaders.warningSnakbar(
          title: 'Data not Saved',
          message:
              'Something went wrong while saving your information. You can re-save your data in your profile');
    }
  }

  // fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading(true);
      final user = await UserRepository().fetchUserDetails();
      this.user(user);
      profileLoading(false);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading(false);
    }
  }

  // delete account warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(TSizes.md),
        title: 'Delete Account',
        middleText:
            'Are you sure you want to delete your account permanently? This action is not be reversible and all your data will be removed permanently.',
        confirm: ElevatedButton(
            onPressed: () async => deleteUserAccount(),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              side: BorderSide(color: Colors.red),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
              child: Text('Delete'),
            )),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: const Text('Cancel')));
  }

  void deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoadingDisplay(
          'Processing', TImages.docerAnimation);

      // first re-athenticate user
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;

      if (provider.isNotEmpty) {
        // re verify auth email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TLoaders.successSnakbar(title: 'Account Deleted Successfully');

          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          TFullScreenLoader.stopLoading();
          Get.to(() => ReAuthUserLoginForm());
        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnakbar(title: 'Oh Snap', message: e.toString);
    }
  }

  // reauthenticate before deleting
  Future<void> reAutheticateEmailAndPasswordUser() async {
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

      if (reAuthFormKey.currentState != null &&
          !reAuthFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();

      TLoaders.successSnakbar(title: 'Account Deleted Successfully');
      // remove loader
      TFullScreenLoader.stopLoading();

      Get.offAll(() => LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnakbar(title: 'Oh Snap', message: e.toString());
    }
  }

  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        imageUploading(true);
        // upload image
        final imageUrl =
            await userRepository.uploadImage('Users/Images/Profile/', image);

        // update user image record
        Map<String, dynamic> json = {'profilePicture': imageUrl};

        await userRepository.updateSingleFeild(json);

        user.value.profilePicture = imageUrl;
        user.refresh();
        TLoaders.successSnakbar(
            title: 'Congratulations',
            message: 'Your Profile has been update successfully');
      }
    } catch (e) {
      TLoaders.errorSnakbar(
          title: 'Oh Snap',
          message: 'error in user controller, Something went wrong :$e');
    } finally {
      imageUploading(false);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchUserRecord();
  }
}
