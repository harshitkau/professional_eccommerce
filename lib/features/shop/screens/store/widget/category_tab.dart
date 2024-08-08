import 'package:flutter/cupertino.dart';
import 'package:prof_ecommerce/common/widgets/brands/brand_showcase.dart';
import 'package:prof_ecommerce/common/widgets/layout/grid_layout.dart';
import 'package:prof_ecommerce/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:prof_ecommerce/common/widgets/texts/section_heading.dart';
import 'package:prof_ecommerce/utils/constants/image_strings.dart';
import 'package:prof_ecommerce/utils/constants/sizes.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // brands
              const TBrandShowcaseCard(image: [
                TImages.productImage1,
                TImages.productImage2,
                TImages.productImage3,
              ]),
              const TBrandShowcaseCard(image: [
                TImages.productImage1,
                TImages.productImage2,
                TImages.productImage3,
              ]),

              const SizedBox(height: TSizes.spaceBtwItems),
              // products
              TSectionHeading(
                  title: 'You might Like',
                  showActionButton: true,
                  onPressed: () {}),

              const SizedBox(height: TSizes.spaceBtwItems),

              GridLayout(
                  itemCount: 4,
                  itemBuilder: (_, context) {
                    return const TProductCardVertical();
                  }),

              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}
