import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prof_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:prof_ecommerce/common/widgets/brands/brand_card.dart';
import 'package:prof_ecommerce/common/widgets/layout/grid_layout.dart';
import 'package:prof_ecommerce/common/widgets/products/sortable/sortable_product.dart';
import 'package:prof_ecommerce/common/widgets/texts/section_heading.dart';
import 'package:prof_ecommerce/features/shop/screens/brand/brand_product.dart';
import 'package:prof_ecommerce/utils/constants/sizes.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Brand',
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // heading
              TSectionHeading(title: 'Brands', showActionButton: false),
              SizedBox(height: TSizes.spaceBtwItems),
              GridLayout(
                  itemCount: 10,
                  mainAxisExtent: 80,
                  itemBuilder: (context, index) {
                    return BrandCard(
                      showBorder: true,
                      onTap: () => Get.to(() => BrandProduct()),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
