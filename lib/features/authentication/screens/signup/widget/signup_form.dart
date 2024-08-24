import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prof_ecommerce/features/authentication/controllers/signup/signup_controller.dart';
import 'package:prof_ecommerce/features/authentication/screens/signup/verify_email.dart';
import 'package:prof_ecommerce/features/authentication/screens/signup/widget/term_and_condition.dart';
import 'package:prof_ecommerce/utils/constants/sizes.dart';
import 'package:prof_ecommerce/utils/constants/text_strings.dart';
import 'package:prof_ecommerce/utils/validators/validation.dart';

class TSignUpForm extends StatelessWidget {
  const TSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Form(
        key: controller.signupFormKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    validator: (value) =>
                        TValidator.validateEmptyText('First Name', value),
                    controller: controller.firstName,
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: TTexts.firstName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                ),
                const SizedBox(width: TSizes.spaceBtwItems),
                Expanded(
                  child: TextFormField(
                    validator: (value) =>
                        TValidator.validateEmptyText('Last Name', value),
                    controller: controller.lastName,
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: TTexts.lastName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            // user name
            TextFormField(
              validator: (value) =>
                  TValidator.validateEmptyText('User Name', value),
              controller: controller.userName,
              expands: false,
              decoration: const InputDecoration(
                  labelText: TTexts.username,
                  prefixIcon: Icon(Iconsax.user_edit)),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            // email
            TextFormField(
              validator: (value) => TValidator.validateEmail(value),
              controller: controller.email,
              decoration: const InputDecoration(
                  labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct)),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            // phone number
            TextFormField(
              validator: (value) => TValidator.validatePhoneNumber(value),
              controller: controller.phoneNumber,
              decoration: const InputDecoration(
                  labelText: TTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            // password
            Obx(
              () => TextFormField(
                validator: (value) => TValidator.validatePassword(value),
                controller: controller.password,
                obscureText: !controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: TTexts.password,
                  prefixIcon: Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    icon: !controller.hidePassword.value
                        ? Icon(Iconsax.eye_slash)
                        : Icon(Iconsax.eye),
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                  ),
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            // terms & condition checkboxes
            const TermAndConditionCheckbox(),
            const SizedBox(height: TSizes.spaceBtwSections),
            // signup button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  controller.signup();
                },
                child: const Text(TTexts.createAccount),
              ),
            )
          ],
        ));
  }
}
