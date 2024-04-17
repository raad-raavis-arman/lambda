import 'package:landa/screens/advertisement_category/data/models/models.dart';

abstract interface class CategoryLocalDataSource {
  List<CategoryModel> getAllCategory();
  void setAllCategory(List<CategoryModel> categories);
}
