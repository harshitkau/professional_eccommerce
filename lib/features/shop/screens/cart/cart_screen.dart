import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prof_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:prof_ecommerce/common/widgets/products/cart/product_price_text.dart';
import 'package:prof_ecommerce/common/widgets/products/cart/t_cart_item.dart';
import 'package:prof_ecommerce/common/widgets/products/cart/product_add_remove.dart';
import 'package:prof_ecommerce/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            separatorBuilder: (_, __) {
              return const SizedBox(
                height: TSizes.spaceBtwItems,
              );
            },
            itemBuilder: (_, int index) {
              return Column(
                children: [
                  TCartItem(),
                  SizedBox(height: TSizes.spaceBtwItems),
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
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () {}, child: Text('Checkout \u{20B9} 256')),
      ),
    );
  }
}
