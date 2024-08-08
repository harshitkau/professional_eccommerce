import 'package:flutter/material.dart';
import 'package:prof_ecommerce/common/widgets/image_text_widget/vertical_image_text.dart';
import 'package:prof_ecommerce/common/widgets/texts/section_heading.dart';
import 'package:prof_ecommerce/utils/constants/image_strings.dart';
import 'package:prof_ecommerce/utils/constants/sizes.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: TSizes.defaultSpace),
      child: Column(
        children: [
          const TSectionHeading(
            title: 'Popular Categories',
            showActionButton: false,
            textColor: Colors.white,
          ),
          const SizedBox(height: TSizes.spaceBtwItems),

          // scollable categories
          SizedBox(
            height: 80,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, index) {
                return TVerticalImage(
                  image: TImages.shoeIcon,
                  title: 'Shoes',
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
