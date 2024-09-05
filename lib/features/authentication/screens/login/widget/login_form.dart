import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prof_ecommerce/features/authentication/controllers/login/login_controller.dart';
import 'package:prof_ecommerce/features/authentication/screens/password_configuration/forgot_password.dart';
import 'package:prof_ecommerce/features/authentication/screens/signup/signup.dart';
import 'package:prof_ecommerce/utils/constants/sizes.dart';
import 'package:prof_ecommerce/utils/constants/text_strings.dart';
import 'package:prof_ecommerce/utils/validators/validation.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            // email
            TextFormField(
              validator: (value) => TValidator.validateEmail(value),
              controller: controller.email,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.email,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            // password
            Obx(
              () => TextFormField(
                validator: (value) => TValidator.validatePassword(value),
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: TTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    icon: controller.hidePassword.value
                        ? const Icon(Iconsax.eye_slash)
                        : const Icon(Iconsax.eye),
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                  ),
                ),
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwInputFields / 2),

            // remember password or forgot password

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => Row(
                    children: [
                      Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value =
                              !controller.rememberMe.value),
                      const Text(TTexts.rememberMe)
                    ],
                  ),
                ),
                TextButton(
                    onPressed: () => Get.to(() => const ForgetPassword()),
                    child: const Text(TTexts.forgetPassword))
              ],
            ),

            const SizedBox(height: TSizes.spaceBtwSections),
            // sign in button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    // print(controller.email);
                    // print(controller.password);
                    print(controller.rememberMe.value);
                    controller.emailAndPasswordSignIn();
                  },
                  child: const Text(TTexts.signIn)),
            ),

            const SizedBox(height: TSizes.spaceBtwItems),
            // create account button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () {
                    Get.to(() => const SignUpScreen());
                  },
                  child: const Text(TTexts.createAccount)),
            ),
            // const SizedBox(height: TSizes.spaceBtwSections / 2),
          ],
        ),
      ),

      // divider
    );
  }
}
