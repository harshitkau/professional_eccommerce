import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prof_ecommerce/utils/constants/sizes.dart';

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('SubTotal', style: Theme.of(context).textTheme.bodyMedium),
            Text('\u{20B9}256', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems / 2),

        // Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('\u{20B9}50', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems / 2),

        // tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Goods and Services Tax',
                style: Theme.of(context).textTheme.bodyMedium),
            Text('\u{20B9}18', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems / 2),
        // Order total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: Theme.of(context).textTheme.bodyMedium),
            Text('\u{20B9}316', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}
