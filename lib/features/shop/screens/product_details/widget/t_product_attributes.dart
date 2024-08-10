import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prof_ecommerce/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:prof_ecommerce/common/widgets/products/cart/product_price_text.dart';
import 'package:prof_ecommerce/common/widgets/texts/product_title_text.dart';
import 'package:prof_ecommerce/common/widgets/texts/section_heading.dart';
import 'package:prof_ecommerce/utils/constants/colors.dart';
import 'package:prof_ecommerce/utils/constants/sizes.dart';
import 'package:prof_ecommerce/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/choice_chips/t_choice_chips.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Column(
            children: [
              // title price and stock status
              Row(
                children: [
                  TSectionHeading(title: 'Variation', showActionButton: false),
                  SizedBox(width: TSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const TProductTitleText(
                              title: 'Price : ', smallSize: true),
                          // actual price
                          Text(
                            '\u{20B9} 250',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: TSizes.spaceBtwItems),
                          const ProductPriceText(price: '150'),
                        ],
                      ),
                      Row(
                        children: [
                          const TProductTitleText(
                              title: 'Stock : ', smallSize: true),
                          const SizedBox(width: TSizes.spaceBtwItems / 2),
                          Text('In Stock',
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      )
                    ],
                  ),
                ],
              ),

              // variation description
              const TProductTitleText(
                title:
                    'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),

        // attribute
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Colors'),
            // const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              children: [
                TChoiceChip(text: 'Green', selected: true, onSeleted: (val) {}),
                TChoiceChip(text: 'Blue', selected: false, onSeleted: (val) {}),
                TChoiceChip(
                    text: 'Yellow', selected: false, onSeleted: (val) {}),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Size'),
            // const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              children: [
                TChoiceChip(text: 'EU 34', selected: true, onSeleted: (val) {}),
                SizedBox(width: TSizes.spaceBtwItems / 2),
                TChoiceChip(
                    text: 'EU 36', selected: false, onSeleted: (val) {}),
                SizedBox(width: TSizes.spaceBtwItems / 2),
                TChoiceChip(
                    text: 'EU 38', selected: false, onSeleted: (val) {}),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
