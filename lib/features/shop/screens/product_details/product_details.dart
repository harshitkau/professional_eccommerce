import 'package:flutter/material.dart';

import 'package:prof_ecommerce/features/shop/screens/product_details/widget/t_product_image_slider.dart';
import 'package:prof_ecommerce/features/shop/screens/product_details/widget/t_product_meta_data.dart';
import 'package:prof_ecommerce/features/shop/screens/product_details/widget/t_rating_share_widget.dart';
import 'package:prof_ecommerce/utils/constants/sizes.dart';
// import 'package:prof_ecommerce/utils/helpers/helper_functions.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = THelperFunctions.isDarkMode(context);
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Product image slider
            TProductImageSlider(),

            // product detials
            Padding(
              padding: EdgeInsets.only(
                right: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace,
                left: TSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  // rating share button
                  TRatingAndShare(),

                  TProductMetaData()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
