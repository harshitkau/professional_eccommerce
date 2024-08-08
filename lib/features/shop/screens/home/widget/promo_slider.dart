import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prof_ecommerce/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:prof_ecommerce/common/widgets/images/rounded_image.dart';
import 'package:prof_ecommerce/features/shop/controllers/home_controller.dart';
import 'package:prof_ecommerce/utils/constants/colors.dart';
import 'package:prof_ecommerce/utils/constants/sizes.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Column(
      children: [
        CarouselSlider(
          items: banners
              .map(
                (url) => TRoundedImage(imageUrl: url),
              )
              .toList(),
          options: CarouselOptions(
            autoPlay: true,
            viewportFraction: 1,
            autoPlayAnimationDuration: const Duration(seconds: 2),
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Center(
          child: Obx(() => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < banners.length; i++)
                    TRoundedContainer(
                      width: 20,
                      height: 4,
                      backgroundColor:
                          controller.carouselCurrentIndex.value == i
                              ? TColors.primary
                              : TColors.grey,
                      margin: const EdgeInsets.only(right: 8),
                    )
                ],
              )),
        ),
      ],
    );
  }
}
