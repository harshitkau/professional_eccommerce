import 'package:flutter/material.dart';
import 'package:prof_ecommerce/features/shop/screens/product_reviews/widget/t_rating_progress_indicator.dart';

class TOverallProductRating extends StatelessWidget {
  const TOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child:
                Text('4.8', style: Theme.of(context).textTheme.displayLarge)),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              TRatingProgressIndicator(
                text: '5',
                value: 0.5,
              ),
              TRatingProgressIndicator(
                text: '4',
                value: 0.8,
              ),
              TRatingProgressIndicator(
                text: '3',
                value: 0.5,
              ),
              TRatingProgressIndicator(
                text: '2',
                value: 0.1,
              ),
              TRatingProgressIndicator(
                text: '1',
                value: 0.0,
              ),
            ],
          ),
        )
      ],
    );
  }
}
