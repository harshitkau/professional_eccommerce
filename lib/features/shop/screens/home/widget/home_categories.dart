import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prof_ecommerce/common/widgets/image_text_widget/vertical_image_text.dart';
import 'package:prof_ecommerce/common/widgets/shimmer_effect/category_shimmer.dart';
import 'package:prof_ecommerce/features/shop/controllers/category_controller.dart';
import 'package:prof_ecommerce/features/shop/screens/sub_category/sub_category.dart';
import 'package:prof_ecommerce/utils/constants/sizes.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Padding(
      padding: const EdgeInsets.only(left: TSizes.defaultSpace),
      child: Obx(() {
        if (controller.isLoading.value) return const TCategoryShimmer();

        if (controller.featuredCategories.isEmpty) {
          return Center(
            child: Text(
              'No Data Found!',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(color: Colors.white),
            ),
          );
        }

        return SizedBox(
          height: 80,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.featuredCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, index) {
              final category = controller.featuredCategories[index];
              return TVerticalImage(
                image: category.image,
                title: category.name,
                onTap: () => Get.to(() => const SubCategory()),
              );
            },
          ),
        );
      }),
    );
  }
}
