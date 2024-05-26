import 'dart:convert';

import 'package:landa/core/utils/utils.dart';
import 'package:landa/screens/advertisement_category/data/datasources/datasources.dart';
import 'package:landa/screens/advertisement_category/data/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubCategoryItemLocalDataSourceImpl
    implements SubCategoryItemLocalDataSource {
  const SubCategoryItemLocalDataSourceImpl(this.preferences);

  final SharedPreferences preferences;

  @override
  List<SubCategoryItemModel> getAllSubCategoryItems() {
    final jsonString = preferences.getString(PreferenceKeys.subCategoryItems);
    if (jsonString == null || jsonString.isEmpty) {
      return [];
    } else {
      final jsonMap = jsonDecode(jsonString) as List<dynamic>;
      return jsonMap
          .map(
            (e) => SubCategoryItemModel.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }
  }

  @override
  void setAllSubCategoryItems(List<SubCategoryItemModel> subCategoryItems) {
    final jsonMap = subCategoryItems.map((e) => e.toJson()).toList();
    final jsonString = jsonEncode(jsonMap);
    preferences.setString(PreferenceKeys.subCategoryItems, jsonString);
  }
}
