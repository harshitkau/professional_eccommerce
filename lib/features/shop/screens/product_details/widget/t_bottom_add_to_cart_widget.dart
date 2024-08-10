import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prof_ecommerce/common/widgets/icons/t_circular_icon.dart';
import 'package:prof_ecommerce/utils/constants/colors.dart';
import 'package:prof_ecommerce/utils/constants/sizes.dart';
import 'package:prof_ecommerce/utils/helpers/helper_functions.dart';

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? TColors.darkerGrey : TColors.light,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(TSizes.cardRadiusLg),
          topRight: Radius.circular(TSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              TCircularIcon(
                backgroundcolor: TColors.darkerGrey,
                width: 40,
                height: 40,
                icon: Iconsax.minus,
                color: TColors.white,
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              Text('2', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: TSizes.spaceBtwItems),
              TCircularIcon(
                backgroundcolor: TColors.black,
                width: 40,
                height: 40,
                icon: Iconsax.add,
                color: TColors.white,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Add to Cart'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(TSizes.md),
              backgroundColor: TColors.black,
              side: const BorderSide(color: TColors.black),
            ),
          )
        ],
      ),
    );
  }
}
