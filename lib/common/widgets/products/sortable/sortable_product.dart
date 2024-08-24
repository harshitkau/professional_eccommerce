import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prof_ecommerce/common/widgets/layout/grid_layout.dart';
import 'package:prof_ecommerce/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:prof_ecommerce/utils/constants/sizes.dart';

class TSortableProduct extends StatelessWidget {
  const TSortableProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Newest',
            'Popularity'
          ]
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
          onChanged: (value) {},
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
        // products
        GridLayout(
            itemCount: 10,
            itemBuilder: (_, index) {
              return TProductCardVertical();
            })
      ],
    );
  }
}
