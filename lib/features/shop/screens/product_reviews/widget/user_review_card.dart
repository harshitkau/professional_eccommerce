import 'package:flutter/material.dart';
import 'package:prof_ecommerce/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:prof_ecommerce/common/widgets/products/rating/t_rating_bar_indicator.dart';
import 'package:prof_ecommerce/utils/constants/colors.dart';
import 'package:prof_ecommerce/utils/constants/image_strings.dart';
import 'package:prof_ecommerce/utils/constants/sizes.dart';
import 'package:prof_ecommerce/utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                    backgroundImage: AssetImage(TImages.userProfileImage1)),
                const SizedBox(width: TSizes.spaceBtwItems),
                Text('Harshit Kaushal',
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2),
        // review
        Row(
          children: [
            TRatingBarIndicator(rating: 4),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text(
              'Aug 10, 2024',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems),
        const ReadMoreText(
          'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.',
          trimLines: 2,
          trimExpandedText: ' show less',
          trimMode: TrimMode.Line,
          moreStyle: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: TColors.black),
          lessStyle: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: TColors.black),
        ),

        const SizedBox(height: TSizes.spaceBtwItems),

        // company review
        TRoundedContainer(
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Padding(
            padding: EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('SpriteEra',
                        style: Theme.of(context).textTheme.bodyLarge),
                    Text('Aug 10, 2024',
                        style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                const ReadMoreText(
                  'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.',
                  trimLines: 2,
                  trimExpandedText: ' show less',
                  trimMode: TrimMode.Line,
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.black),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.black),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections)
      ],
    );
  }
}
