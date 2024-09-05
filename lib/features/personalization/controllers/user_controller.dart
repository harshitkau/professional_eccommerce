import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:prof_ecommerce/data/user/user_repository.dart';
import 'package:prof_ecommerce/features/authentication/models/user_model.dart';
import 'package:prof_ecommerce/utils/popup/loders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  // save the user record from any registration provider

  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        final nameParts =
            UserModel.nameParts(userCredential.user!.displayName ?? "");

        final userName =
            UserModel.generateUserName(userCredential.user!.displayName ?? "");
        final user = UserModel(
          id: userCredential.user!.uid,
          userName: userName,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          email: userCredential.user!.email ?? '',
          phoneNumber: userCredential.user!.phoneNumber ?? '',
          profilePicture: userCredential.user!.photoURL ?? '',
        );

        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      TLoaders.warningSnakbar(
          title: 'Data not Saved',
          message:
              'Something went wrong while saving your information. You can re-save your data in your profile');
    }
  }
}
