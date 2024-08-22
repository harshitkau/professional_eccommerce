import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prof_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:prof_ecommerce/common/widgets/images/rounded_image.dart';
import 'package:prof_ecommerce/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:prof_ecommerce/common/widgets/texts/section_heading.dart';
import 'package:prof_ecommerce/utils/constants/image_strings.dart';
import 'package:prof_ecommerce/utils/constants/sizes.dart';

class SubCategory extends StatelessWidget {
  const SubCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Sports Shirts'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TRoundedImage(
                imageUrl: TImages.promoBanner1,
                width: double.infinity,
                height: null,
                applyImageRadius: true,
              ),
              SizedBox(height: TSizes.spaceBtwSections),

              // sub-category
              Column(
                children: [
                  TSectionHeading(
                    title: 'Sports Shirts',
                    onPressed: () {},
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),

                  // SizedBox(height: TSizes.spaceBtwItems / 2),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (_, __) =>
                          SizedBox(width: TSizes.spaceBtwItems),
                      itemBuilder: (_, index) => const TProductCardHorizontal(),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
