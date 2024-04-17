import 'dart:convert';

import 'package:landa/core/utils/utils.dart';
import 'package:landa/screens/advertisement_category/data/datasources/datasources.dart';
import 'package:landa/screens/advertisement_category/data/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubCategoryLocalDataSourceImpl implements SubCategoryLocalDataSource {
  const SubCategoryLocalDataSourceImpl(this.preferences);

  final SharedPreferences preferences;

  @override
  List<SubCategoryModel> getAllSubCategory() {
    final jsonString = preferences.getString(PreferenceKeys.subCategories);
    if (jsonString == null || jsonString.isEmpty) {
      return [];
    } else {
      final jsonMap = jsonDecode(jsonString) as List<dynamic>;
      return jsonMap
          .map(
            (e) => SubCategoryModel.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }
  }

  @override
  void setAllSubCategory(List<SubCategoryModel> subCategories) {
    final jsonMap = subCategories.map((e) => e.toJson()).toList();
    final jsonString = jsonEncode(jsonMap);
    preferences.setString(PreferenceKeys.subCategories, jsonString);
  }
}
