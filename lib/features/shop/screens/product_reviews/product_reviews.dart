import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prof_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:prof_ecommerce/common/widgets/products/rating/t_rating_bar_indicator.dart';
import 'package:prof_ecommerce/features/shop/screens/product_reviews/widget/t_overall_product_rating.dart';
import 'package:prof_ecommerce/features/shop/screens/product_reviews/widget/user_review_card.dart';
import 'package:prof_ecommerce/utils/constants/sizes.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Reviews & Rating'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Rating and review are verified and are from people who use the same type of device the you are used"),

              // overall product rating
              const TOverallProductRating(),
              TRatingBarIndicator(rating: 3),
              Text(
                '12,526',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              // user  review list
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
