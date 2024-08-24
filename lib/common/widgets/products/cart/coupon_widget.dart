import 'package:flutter/material.dart';
import 'package:prof_ecommerce/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:prof_ecommerce/utils/constants/colors.dart';
import 'package:prof_ecommerce/utils/constants/sizes.dart';
import 'package:prof_ecommerce/utils/helpers/helper_functions.dart';

class TCouponCode extends StatelessWidget {
  const TCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? TColors.dark : TColors.white,
      padding: const EdgeInsets.only(
        top: TSizes.sm,
        bottom: TSizes.sm,
        right: TSizes.sm,
        left: TSizes.md,
      ),
      child: Row(
        children: [
          // text field
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Have a promo code? Enter here',
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          // button
          SizedBox(
            width: 80,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: dark
                      ? TColors.white.withOpacity(0.5)
                      : TColors.dark.withOpacity(0.5),
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  side: BorderSide(
                    color: Colors.grey.withOpacity(0.1),
                  ),
                ),
                onPressed: () {},
                child: const Text('Apply')),
          ),
        ],
      ),
    );
  }
}
