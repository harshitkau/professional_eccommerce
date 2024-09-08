import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prof_ecommerce/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:prof_ecommerce/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:prof_ecommerce/common/widgets/layout/grid_layout.dart';
import 'package:prof_ecommerce/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:prof_ecommerce/common/widgets/texts/section_heading.dart';
import 'package:prof_ecommerce/features/shop/screens/all_product/all_product.dart';
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
            const TPrimaryHeaderContainer(
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
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                    child: TSectionHeading(
                      title: 'Popular Categories',
                      showActionButton: false,
                      textColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  THomeCategories(),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  )
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
                  TSectionHeading(
                      title: 'Popular Products',
                      onPressed: () => Get.to(() => const AllProduct())),
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
