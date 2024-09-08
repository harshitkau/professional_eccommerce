import 'package:get/get.dart';
import 'package:prof_ecommerce/data/repositories/categories/category_repository.dart';
import 'package:prof_ecommerce/features/shop/models/category_model.dart';
import 'package:prof_ecommerce/utils/popup/loders.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final _categoryRepository = Get.put(CategoryRepository());

  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  final isLoading = false.obs;
  // load category data
  Future<void> fetchCategories() async {
    try {
      isLoading(true);

      // fetch categories form data sources (firestore and api)
      final categories = await _categoryRepository.getAllCategories();

      // update category list
      allCategories.assignAll(categories);

      // filter fetured categories list
      featuredCategories.assignAll(
        allCategories
            .where(
                (category) => category.isFeatured && category.parentId.isEmpty)
            .take(8)
            .toList(),
      );
    } catch (e) {
      TLoaders.errorSnakbar(title: 'Oh Snap', message: e.toString());
    } finally {
      // remove loaders
      isLoading(false);
    }
  }
  // load selected category data

  // get category or sub category product
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchCategories();
  }
}
