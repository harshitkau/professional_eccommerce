import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:prof_ecommerce/common/styles/spacing_style.dart';
import 'package:prof_ecommerce/utils/constants/sizes.dart';
import 'package:prof_ecommerce/utils/constants/text_strings.dart';
import 'package:prof_ecommerce/utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.onPressed,
    this.isAnimation = false,
  });

  final String image, title, subTitle;
  final VoidCallback onPressed;
  final bool? isAnimation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppbarHeight * 2,
          child: Column(
            children: [
              // images
              isAnimation == false
                  ? Image(
                      image: AssetImage(image),
                      width: THelperFunctions.screenWidth() * 0.6)
                  : Lottie.asset(image,
                      width: MediaQuery.of(context).size.width * 0.8),

              const SizedBox(height: TSizes.spaceBtwSections),
// titie and subtitle
              Text(title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),

              const SizedBox(height: TSizes.spaceBtwItems),
              Text(subTitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBtwSections),

              // button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: const Text(TTexts.tContinue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
