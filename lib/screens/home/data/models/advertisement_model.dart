import 'package:json_annotation/json_annotation.dart';
import 'package:landa/screens/advertisement_area/data/models/models.dart';
import 'package:landa/screens/advertisement_category/data/models/models.dart';
import 'package:landa/screens/home/domain/entities/advertisement.dart';

part 'advertisement_model.g.dart';

@JsonSerializable()
class AdvertisementModel extends Advertisement {
      
  const AdvertisementModel({
    required super.id,
    required super.title,
    required super.description,
    required super.adCreateDateTime,
    required super.adExpireDateTime,
    required super.pCreateDateTime,
    required super.pExpireDateTime,
    required super.originalPrice,
    required super.discountedPrice,
    required super.discount,
    required super.count,
    required super.contactNumber,
    required super.showContactInfo,
    required this.mCategory,
    required this.mSubCategory,
    required this.mProvince,
    required this.mCity,
  }) : super(
          subCategory: mSubCategory,
          category: mCategory,
          province: mProvince,
          city: mCity,
        );

  factory AdvertisementModel.fromJson(Map<String, dynamic> json) =>
      _$AdvertisementModelFromJson(json);

  @JsonKey(name: 'category')
  final CategoryModel mCategory;
  @JsonKey(name: 'sub_category')
  final SubCategoryModel mSubCategory;
  @JsonKey(name: 'province')
  final ProvinceModel mProvince;
  @JsonKey(name: 'city')
  final CityModel mCity;

  Map<String, dynamic> toJson() => _$AdvertisementModelToJson(this);
}