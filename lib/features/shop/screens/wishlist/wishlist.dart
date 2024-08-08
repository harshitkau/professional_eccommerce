import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prof_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:prof_ecommerce/common/widgets/icons/t_circular_icon.dart';
import 'package:prof_ecommerce/common/widgets/layout/grid_layout.dart';
import 'package:prof_ecommerce/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:prof_ecommerce/features/shop/screens/home/home.dart';
import 'package:prof_ecommerce/utils/constants/sizes.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: const Text('Wishlist'),
        action: [
          TCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(() => const HomeScreen()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              GridLayout(
                  itemCount: 14,
                  itemBuilder: (_, index) {
                    return const TProductCardVertical();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
