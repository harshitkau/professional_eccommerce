import 'package:flutter/material.dart';
import 'package:prof_ecommerce/common/widgets/images/circular_image.dart';

import 'package:prof_ecommerce/utils/constants/sizes.dart';

class TVerticalImage extends StatelessWidget {
  const TVerticalImage({
    super.key,
    required this.image,
    required this.title,
    this.textColor = Colors.white,
    this.backgroundColor,
    this.onTap,
    this.isNetworkImage = true,
  });
  final isNetworkImage;
  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            TCircularImage(
              isNetworkImage: true,
              image: image,
              fit: BoxFit.cover,
              padding: TSizes.sm * 1.4,
              backgroundColor: backgroundColor,
              // overLayColor: THelperFunctions.isDarkMode(context)
              //     ? TColors.light
              //     : TColors.dark,
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
