import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prof_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:prof_ecommerce/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:prof_ecommerce/common/widgets/icons/t_circular_icon.dart';
import 'package:prof_ecommerce/common/widgets/images/rounded_image.dart';
import 'package:prof_ecommerce/utils/constants/colors.dart';
import 'package:prof_ecommerce/utils/constants/image_strings.dart';
import 'package:prof_ecommerce/utils/constants/sizes.dart';
import 'package:prof_ecommerce/utils/helpers/helper_functions.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TCurveEdgeWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            // main large image
            const SizedBox(
              height: 400,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(TSizes.productImageRadius * 2),
                  child: Image(
                    image: AssetImage(TImages.productImage5),
                  ),
                ),
              ),
            ),

            // image slider
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: TSizes.spaceBtwItems),
                  itemBuilder: (_, int index) {
                    return TRoundedImage(
                      width: 80,
                      backgroundColor: dark ? TColors.dark : TColors.white,
                      border: Border.all(color: TColors.primary),
                      padding: EdgeInsets.all(TSizes.sm),
                      imageUrl: TImages.productImage13,
                    );
                  },
                ),
              ),
            ),

            // appbar icon
            const TAppBar(
              showBackArrow: true,
              action: [TCircularIcon(icon: Iconsax.heart5, color: Colors.red)],
            )
          ],
        ),
      ),
    );
  }
}
