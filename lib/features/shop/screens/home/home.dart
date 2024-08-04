import 'package:flutter/material.dart';
import 'package:prof_ecommerce/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:prof_ecommerce/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:prof_ecommerce/common/widgets/layout/grid_layout.dart';
import 'package:prof_ecommerce/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:prof_ecommerce/features/shop/screens/home/widget/home_app_bar.dart';
import 'package:prof_ecommerce/features/shop/screens/home/widget/home_categories.dart';
import 'package:prof_ecommerce/features/shop/screens/home/widget/promo_slider.dart';
import 'package:prof_ecommerce/utils/constants/image_strings.dart';
import 'package:prof_ecommerce/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  THomeAppbar(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  // custom search bar
                  TSearchContainer(
                    text: 'Search in Store',
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                  // Categories
                  THomeCategories(),
                ],
              ),
            ),

            // corousal
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  // promo slider
                  const TPromoSlider(
                    banners: [
                      TImages.banner1,
                      TImages.promoBanner2,
                      TImages.promoBanner3,
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  // popular product
                  GridLayout(
                    itemCount: 10,
                    itemBuilder: (_, int) {
                      return const TProductCardVertical();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
