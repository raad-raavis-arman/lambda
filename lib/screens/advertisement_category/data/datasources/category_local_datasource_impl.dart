import 'dart:convert';

import 'package:landa/core/utils/utils.dart';
import 'package:landa/screens/advertisement_category/data/datasources/datasources.dart';
import 'package:landa/screens/advertisement_category/data/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryLocalDataSourceImpl implements CategoryLocalDataSource {
  const CategoryLocalDataSourceImpl(
    this.preferences,
  );

  final SharedPreferences preferences;

  @override
  List<CategoryModel> getAllCategory() {
    final jsonString = preferences.getString(PreferenceKeys.categories);
    if (jsonString == null || jsonString.isEmpty) {
      return [];
    } else {
      final jsonMap = jsonDecode(jsonString) as List<dynamic>;
      return jsonMap
          .map(
            (e) => CategoryModel.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }
  }

  @override
  void setAllCategory(List<CategoryModel> categories) {
    final jsonMap = categories.map((e) => e.toJson()).toList();
    final jsonString = jsonEncode(jsonMap);
    preferences.setString(PreferenceKeys.categories, jsonString);
  }
}
