import 'package:landa/screens/advertisement_category/data/models/models.dart';

abstract interface class SubCategoryItemLocalDataSource {
  List<SubCategoryItemModel> getAllSubCategoryItems();
  void setAllSubCategoryItems(List<SubCategoryItemModel> subCategoryItems);
}
