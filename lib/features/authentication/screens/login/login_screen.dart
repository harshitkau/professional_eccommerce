import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prof_ecommerce/common/styles/spacing_style.dart';
import 'package:prof_ecommerce/common/widgets/login_signup/form_divider.dart';
import 'package:prof_ecommerce/common/widgets/login_signup/social_button.dart';
import 'package:prof_ecommerce/features/authentication/screens/login/widget/login_form.dart';
import 'package:prof_ecommerce/features/authentication/screens/login/widget/login_header.dart';
import 'package:prof_ecommerce/utils/constants/sizes.dart';
import 'package:prof_ecommerce/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppbarHeight,
          child: Column(
            children: [
              // Logo, title and substitle
              const TLoginHeader(),

              const TLoginForm(),
              TLoginDivider(
                dividertext: TTexts.orSignInWith.capitalize,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              // footer

              TSocialButton()
            ],
          ),
        ),
      ),
    );
  }
}
