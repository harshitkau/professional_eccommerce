import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:prof_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:prof_ecommerce/common/widgets/products/cart/product_price_text.dart';
import 'package:prof_ecommerce/common/widgets/products/cart/t_cart_item.dart';
import 'package:prof_ecommerce/common/widgets/products/cart/product_add_remove.dart';
import 'package:prof_ecommerce/features/shop/screens/cart/widget/cart_items.dart';
import 'package:prof_ecommerce/features/shop/screens/checkout/checkout.dart';
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
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: TCartItems(),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {
            Get.to(() => CheckoutScreen());
          },
          child: Text('Checkout \u{20B9} 256'),
        ),
      ),
    );
  }
}
