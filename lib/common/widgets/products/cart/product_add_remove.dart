import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prof_ecommerce/common/widgets/icons/t_circular_icon.dart';
import 'package:prof_ecommerce/utils/constants/colors.dart';
import 'package:prof_ecommerce/utils/constants/sizes.dart';
import 'package:prof_ecommerce/utils/helpers/helper_functions.dart';

class TProductQuantityAddRemove extends StatelessWidget {
  const TProductQuantityAddRemove({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // add remove button
        TCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: TSizes.sm,
          color: THelperFunctions.isDarkMode(context)
              ? TColors.white
              : TColors.black,
          backgroundcolor: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.light,
        ),
        SizedBox(width: TSizes.spaceBtwItems),
        Text('2', style: Theme.of(context).textTheme.titleSmall),
        SizedBox(width: TSizes.spaceBtwItems),
        TCircularIcon(
          width: 32,
          height: 32,
          size: TSizes.md,
          backgroundcolor: TColors.primary,
          icon: Iconsax.add,
          color: TColors.white,
        ),
      ],
    );
  }
}
