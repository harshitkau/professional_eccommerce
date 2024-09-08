import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:prof_ecommerce/features/shop/models/category_model.dart';
import 'package:prof_ecommerce/utils/exceptions/firebase_exceptions.dart';
import 'package:prof_ecommerce/utils/exceptions/platform_exceptions.dart';
import 'package:prof_ecommerce/utils/firebase_Storage/firebase_storage.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  // variables
  final _db = FirebaseFirestore.instance;

  // get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot =
          await _db.collection('categories').get(); // get all categories data

      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList(); //load data in the list
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again: $e';
    }
  }
  // get sub categories

  // upload categories to the cloud firestore
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      final storage = Get.put(TFirebaseStorageService());
      // loop through each category
      for (var category in categories) {
        final file = await storage.getImageDataFromAssets(category.image);

        // upload image and get link
        final url =
            await storage.uploadImageData('Categories', file, category.name);

        category.image = url;

        // storage category in firestore
        await _db
            .collection('categories')
            .doc(category.id)
            .set(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again: $e';
    }
  }
}
