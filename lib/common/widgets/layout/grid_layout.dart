import 'package:flutter/material.dart';
import 'package:prof_ecommerce/utils/constants/sizes.dart';

class GridLayout extends StatelessWidget {
  const GridLayout({
    super.key,
    required this.itemCount,
    this.mainAxisExtent = 288,
    required this.itemBuilder,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: TSizes.gridViewSpacing,
            crossAxisSpacing: TSizes.gridViewSpacing,
            mainAxisExtent: mainAxisExtent),
        itemCount: itemCount,
        shrinkWrap: true,
        itemBuilder: itemBuilder);
  }
}
