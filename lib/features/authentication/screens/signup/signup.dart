import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prof_ecommerce/common/widgets/login_signup/form_divider.dart';
import 'package:prof_ecommerce/common/widgets/login_signup/social_button.dart';
import 'package:prof_ecommerce/features/authentication/screens/signup/widget/signup_form.dart';
import 'package:prof_ecommerce/utils/constants/sizes.dart';
import 'package:prof_ecommerce/utils/constants/text_strings.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium),

            const SizedBox(height: TSizes.spaceBtwItems),
            // form
            TSignUpForm(),

            const SizedBox(height: TSizes.spaceBtwSections),
            // divider
            TLoginDivider(dividertext: TTexts.orSignInWith.capitalize),

            const SizedBox(height: TSizes.spaceBtwSections),
            // social buttons
            const TSocialButton(),
          ],
        ),
      )),
    );
  }
}
