import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prof_ecommerce/features/authentication/controllers/forgot_password/forgot_password_controller.dart';
import 'package:prof_ecommerce/features/authentication/screens/login/login_screen.dart';
import 'package:prof_ecommerce/utils/constants/image_strings.dart';
import 'package:prof_ecommerce/utils/constants/sizes.dart';
import 'package:prof_ecommerce/utils/constants/text_strings.dart';
import 'package:prof_ecommerce/utils/helpers/helper_functions.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({required this.email, super.key});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.clear))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                // images
                Image(
                    image: const AssetImage(TImages.deliveredEmailIllustration),
                    width: THelperFunctions.screenWidth() * 0.6),

                const SizedBox(height: TSizes.spaceBtwSections),
//email, titie and subtitle
                Text(email,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center),
                Text(TTexts.changeYourPasswordTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center),

                const SizedBox(height: TSizes.spaceBtwItems),
                Text(TTexts.changeYourPasswordSubTitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center),
                const SizedBox(height: TSizes.spaceBtwSections),

                // button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Get.offAll(() => const LoginScreen()),
                    child: const Text(TTexts.done),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () => ForgotPasswordController.instance
                        .resendPasswordEmail(email),
                    child: const Text(TTexts.resendEmail),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
