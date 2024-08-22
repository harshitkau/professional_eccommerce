import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prof_ecommerce/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:prof_ecommerce/utils/constants/colors.dart';
import 'package:prof_ecommerce/utils/constants/sizes.dart';
import 'package:prof_ecommerce/utils/helpers/helper_functions.dart';

class OrderList extends StatelessWidget {
  const OrderList({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      separatorBuilder: (_, __) => SizedBox(
        height: TSizes.spaceBtwItems,
      ),
      itemCount: 4,
      itemBuilder: (_, index) {
        return TRoundedContainer(
          showBorder: true,
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.dark : TColors.light,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Icon(Iconsax.ship),
                  SizedBox(width: TSizes.spaceBtwItems / 2),

                  // status date
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Processing',
                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                                color: TColors.primary,
                                fontWeightDelta: 1,
                              ),
                        ),
                        Text('Aug 15, 2024',
                            style: Theme.of(context).textTheme.headlineSmall),
                      ],
                    ),
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Iconsax.arrow_right_34,
                      size: TSizes.iconSm,
                    ),
                  ),
                ],
              ),
              SizedBox(height: TSizes.spaceBtwItems),
              // row 2
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const Icon(Iconsax.tag),
                        SizedBox(width: TSizes.spaceBtwItems / 2),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Order',
                                  style:
                                      Theme.of(context).textTheme.labelMedium),
                              Text('[#24765]',
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        const Icon(Iconsax.calendar),
                        SizedBox(width: TSizes.spaceBtwItems / 2),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Shipping Date',
                                  style:
                                      Theme.of(context).textTheme.labelMedium),
                              Text('Aug 20, 2024',
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
