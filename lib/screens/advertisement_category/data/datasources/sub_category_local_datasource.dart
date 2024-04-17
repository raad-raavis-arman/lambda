import 'package:landa/screens/advertisement_category/data/models/models.dart';

abstract interface class SubCategoryLocalDataSource {
  List<SubCategoryModel> getAllSubCategory();
  void setAllSubCategory(List<SubCategoryModel> subCategories);
}
