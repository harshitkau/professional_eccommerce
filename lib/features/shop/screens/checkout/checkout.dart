import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prof_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:prof_ecommerce/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:prof_ecommerce/common/widgets/products/cart/coupon_widget.dart';
import 'package:prof_ecommerce/common/widgets/success_screen/success_screen.dart';
import 'package:prof_ecommerce/features/shop/screens/cart/widget/cart_items.dart';
import 'package:prof_ecommerce/features/shop/screens/checkout/widget/billing_address_section.dart';
import 'package:prof_ecommerce/features/shop/screens/checkout/widget/billing_amount_section.dart';
import 'package:prof_ecommerce/features/shop/screens/checkout/widget/billing_payment_section.dart';
import 'package:prof_ecommerce/navigation_menu.dart';
import 'package:prof_ecommerce/utils/constants/colors.dart';
import 'package:prof_ecommerce/utils/constants/image_strings.dart';
import 'package:prof_ecommerce/utils/constants/sizes.dart';
import 'package:prof_ecommerce/utils/helpers/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // items in cart
              const TCartItems(showAddRemoveButtons: false),
              const SizedBox(height: TSizes.spaceBtwSections),

              // coupon textfield
              const TCouponCode(),

              const SizedBox(height: TSizes.spaceBtwSections),

              TRoundedContainer(
                padding: const EdgeInsets.all(TSizes.md),
                showBorder: true,
                backgroundColor: dark ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    // Pricing
                    TBillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems),
                    // Divider
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems),
                    // Payment
                    TBillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems),
                    // Address

                    TBillingAddressSection()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {
            Get.to(() => SuccessScreen(
                  image: TImages.successfulPaymentIcon,
                  title: 'Payment Succes!',
                  subTitle: 'Your item will be shipped soon!',
                  onPressed: () => Get.offAll(() => const NavigationMenu()),
                ));
          },
          child: const Text('Checkout \u{20B9} 256'),
        ),
      ),
    );
  }
}
