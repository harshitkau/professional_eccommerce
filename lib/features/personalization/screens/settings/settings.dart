import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prof_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:prof_ecommerce/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:prof_ecommerce/common/widgets/list_tile/settings_menu_tile.dart';
import 'package:prof_ecommerce/common/widgets/list_tile/user_profile_tile.dart';
import 'package:prof_ecommerce/common/widgets/texts/section_heading.dart';
import 'package:prof_ecommerce/features/personalization/screens/address/address.dart';
import 'package:prof_ecommerce/features/personalization/screens/profile/profile.dart';
import 'package:prof_ecommerce/utils/constants/colors.dart';
import 'package:prof_ecommerce/utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                    title: Text(
                      'Account',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: TColors.white),
                    ),
                  ),

                  // user profile card
                  TUserProfile(
                    onTap: () => Get.to((() => ProfileScreen())),
                  ),

                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  )
                ],
              ),
            ),

            //body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  // account settings
                  const TSectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  TSettingsMenuTile(
                      onTap: () => Get.to(() => UserAddressScreen()),
                      icon: Iconsax.safe_home,
                      title: 'My Addresses',
                      subTitle: 'Set shopping delivery address'),
                  const TSettingsMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: 'My Cart',
                      subTitle: 'Add, remove products and move to checkout'),
                  const TSettingsMenuTile(
                      icon: Iconsax.bag_tick,
                      title: 'My Orders',
                      subTitle: 'In-progress and Completed Orders'),
                  const TSettingsMenuTile(
                      icon: Iconsax.bank,
                      title: 'Bank Account',
                      subTitle: 'Withdraw balance to registered bank account'),
                  const TSettingsMenuTile(
                      icon: Iconsax.discount_shape,
                      title: 'My Coupons',
                      subTitle: 'List of all the discounted coupons'),
                  const TSettingsMenuTile(
                      icon: Iconsax.notification,
                      title: 'Notifications',
                      subTitle: 'Set any kind of notification message'),
                  const TSettingsMenuTile(
                      icon: Iconsax.security_card,
                      title: 'Account Privacy',
                      subTitle: 'Manage data usage and connected accounts'),

                  // app settings
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const TSectionHeading(
                      title: 'App Settings', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const TSettingsMenuTile(
                      icon: Iconsax.document_upload,
                      title: 'Load Data',
                      subTitle: 'Upload Data to your cloud Firebase'),
                  TSettingsMenuTile(
                      icon: Iconsax.location,
                      title: 'Geolocation',
                      subTitle: 'Set recommendation based on location',
                      trailing: Switch(
                          activeTrackColor: TColors.primary,
                          value: true,
                          onChanged: (value) {})),
                  TSettingsMenuTile(
                      icon: Iconsax.security_user,
                      title: 'Safe Mode',
                      subTitle: 'Search result is safe all ages',
                      trailing: Switch(
                          activeTrackColor: TColors.primary,
                          value: false,
                          onChanged: (value) {})),
                  TSettingsMenuTile(
                      icon: Iconsax.location,
                      title: 'HD Image Quality',
                      subTitle: 'Set image quality to be seen',
                      trailing: Switch(
                          activeTrackColor: TColors.primary,
                          value: true,
                          onChanged: (value) {})),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
