import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prof_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:prof_ecommerce/common/widgets/images/circular_image.dart';
import 'package:prof_ecommerce/common/widgets/texts/section_heading.dart';
import 'package:prof_ecommerce/features/personalization/screens/profile/widget/profile_menu.dart';
import 'package:prof_ecommerce/utils/constants/image_strings.dart';
import 'package:prof_ecommerce/utils/constants/sizes.dart';
import 'package:prof_ecommerce/utils/device/device_utility.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const TCircularImage(image: TImages.user, width: 80, height: 80),
                    TextButton(
                        onPressed: () {}, child: const Text('Change Profile Picture'))
                  ],
                ),
              ),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              const TSectionHeading(
                  title: 'Profile Information', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(
                  onPressed: () {}, title: 'Name', value: 'Harshit Kaushal'),
              TProfileMenu(
                  onPressed: () {}, title: 'UserName', value: 'harshitk002'),

              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Heading personal info
              const TSectionHeading(
                  title: 'Personal Information', showActionButton: false),

              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(
                onPressed: () {},
                title: 'User ID',
                value: '12365',
                icon: Iconsax.copy,
              ),
              TProfileMenu(
                  onPressed: () {},
                  title: 'E-mail',
                  value: 'harshitkaushal@gmail.com'),
              TProfileMenu(
                  onPressed: () {},
                  title: 'Phone Number',
                  value: '+91 8726558201'),
              TProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male'),
              TProfileMenu(
                  onPressed: () {},
                  title: 'Date of Birth',
                  value: '27 April 2001'),

              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              Center(
                child: Container(
                  width: TDeviceUtils.getScreenWidth(context),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.red)),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Close Account',
                        style: TextStyle(
                          color: Colors.red,
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
