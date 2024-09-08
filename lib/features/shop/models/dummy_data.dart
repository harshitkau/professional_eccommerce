import 'package:prof_ecommerce/features/shop/models/category_model.dart';
import 'package:prof_ecommerce/utils/constants/image_strings.dart';

class TDummyData {
  // list of all categories
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: '1', name: 'Sports', image: TImages.sportIcon, isFeatured: true),
    CategoryModel(
        id: '5',
        name: 'Furniture',
        image: TImages.furnitureIcon,
        isFeatured: true),
    CategoryModel(
        id: '2',
        name: 'Electronics',
        image: TImages.electronicsIcon,
        isFeatured: true),
    CategoryModel(
        id: '3', name: 'Clothes', image: TImages.clothIcon, isFeatured: true),
    CategoryModel(
        id: '4', name: 'Animals', image: TImages.animalIcon, isFeatured: true),
    CategoryModel(
        id: '6', name: 'Shoes', image: TImages.shoeIcon, isFeatured: true),
    CategoryModel(
        id: '7',
        name: 'Cosmetic',
        image: TImages.cosmeticsIcon,
        isFeatured: true),
    CategoryModel(
        id: '14',
        name: 'Jewelery',
        image: TImages.cosmeticsIcon,
        isFeatured: true),

    // subcategory
    CategoryModel(
        id: '8',
        name: 'Sport Shoes',
        image: TImages.sportIcon,
        isFeatured: false,
        parentId: '1'),
    CategoryModel(
        id: '9',
        name: 'Track Suits',
        image: TImages.sportIcon,
        isFeatured: false,
        parentId: '1'),
    CategoryModel(
        id: '10',
        name: 'Sport Equipment',
        image: TImages.sportIcon,
        isFeatured: false,
        parentId: '1'),

    // furniture
    CategoryModel(
        id: '11',
        name: 'Bedroom Furniture',
        image: TImages.furnitureIcon,
        isFeatured: false,
        parentId: '5'),
    CategoryModel(
        id: '12',
        name: 'Kitchen Furniture',
        image: TImages.furnitureIcon,
        isFeatured: false,
        parentId: '5'),
    CategoryModel(
        id: '13',
        name: 'Office Furniture',
        image: TImages.furnitureIcon,
        isFeatured: false,
        parentId: '5'),

    // electronics
    CategoryModel(
        id: '15',
        name: 'Laptop',
        image: TImages.electronicsIcon,
        isFeatured: false,
        parentId: '5'),
    CategoryModel(
        id: '16',
        name: 'Mobile',
        image: TImages.electronicsIcon,
        isFeatured: false,
        parentId: '5'),

    // clothes
    CategoryModel(
        id: '17',
        name: 'Clothes',
        image: TImages.clothIcon,
        isFeatured: false,
        parentId: '3'),
  ];
}
