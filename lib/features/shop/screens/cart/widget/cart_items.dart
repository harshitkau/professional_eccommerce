import 'package:flutter/cupertino.dart';
import 'package:prof_ecommerce/common/widgets/products/cart/product_add_remove.dart';
import 'package:prof_ecommerce/common/widgets/products/cart/product_price_text.dart';
import 'package:prof_ecommerce/common/widgets/products/cart/t_cart_item.dart';
import 'package:prof_ecommerce/utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: 2,
      separatorBuilder: (_, __) {
        return const SizedBox(
          height: TSizes.spaceBtwItems,
        );
      },
      itemBuilder: (_, int index) {
        return Column(
          children: [
            // cart item
            TCartItem(),
            if (showAddRemoveButtons)
              const SizedBox(height: TSizes.spaceBtwItems),

            // Add remove button row with total price
            if (showAddRemoveButtons)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 70),
                      TProductQuantityAddRemove(),
                    ],
                  ),
                  ProductPriceText(price: '256')
                ],
              ),
            SizedBox(height: TSizes.spaceBtwItems),
          ],
        );
      },
    );
  }
}
