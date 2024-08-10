import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prof_ecommerce/common/widgets/texts/section_heading.dart';
import 'package:prof_ecommerce/features/shop/screens/product_details/widget/t_bottom_add_to_cart_widget.dart';
import 'package:prof_ecommerce/features/shop/screens/product_details/widget/t_product_attributes.dart';

import 'package:prof_ecommerce/features/shop/screens/product_details/widget/t_product_image_slider.dart';
import 'package:prof_ecommerce/features/shop/screens/product_details/widget/t_product_meta_data.dart';
import 'package:prof_ecommerce/features/shop/screens/product_details/widget/t_rating_share_widget.dart';
import 'package:prof_ecommerce/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:prof_ecommerce/utils/constants/sizes.dart';
import 'package:readmore/readmore.dart';
// import 'package:prof_ecommerce/utils/helpers/helper_functions.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Product image slider
            TProductImageSlider(),

            // product detials
            Padding(
              padding: const EdgeInsets.only(
                right: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace,
                left: TSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  // rating share button
                  TRatingAndShare(),

                  // price, title and stock
                  TProductMetaData(),

                  // attributes
                  TProductAttributes(),

                  SizedBox(height: TSizes.spaceBtwSections),

                  // checkour button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: Text('Checkout')),
                  ),

                  const SizedBox(height: TSizes.spaceBtwSections),
                  // Description
                  const TSectionHeading(
                      title: 'Description', showActionButton: false),

                  // reviews
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  const ReadMoreText(
                    'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  // reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TSectionHeading(
                        title: 'Review (199)',
                        showActionButton: false,
                      ),
                      IconButton(
                          onPressed: () {
                            Get.to(() => ProductReviewScreen());
                          },
                          icon: const Icon(Iconsax.arrow_right_3, size: 18)),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
