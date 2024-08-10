import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prof_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:prof_ecommerce/utils/constants/sizes.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Add New Address')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    label: Text('Name'),
                  ),
                ),
                SizedBox(height: TSizes.spaceBtwInputFields),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.mobile),
                    label: Text('Phone Number'),
                  ),
                ),
                SizedBox(height: TSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.building_31),
                          label: Text('Street'),
                        ),
                      ),
                    ),
                    SizedBox(width: TSizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.location),
                          label: Text('Pin Code '),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: TSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.building),
                          label: Text('City'),
                        ),
                      ),
                    ),
                    SizedBox(width: TSizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.location),
                          label: Text('State'),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: TSizes.spaceBtwInputFields),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.global),
                    label: Text('Country'),
                  ),
                ),
                const SizedBox(height: TSizes.defaultSpace),
                SizedBox(
                    width: double.infinity,
                    child:
                        ElevatedButton(onPressed: () {}, child: Text('Save')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
