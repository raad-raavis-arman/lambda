import 'package:json_annotation/json_annotation.dart';
import 'package:landa/screens/create_advertisement/domain/entities/entities.dart';

part 'create_advertisement_model.g.dart';

@JsonSerializable()
class CreateAdvertisementModel extends CreateAdvertisement {
  const CreateAdvertisementModel({
    required super.pType,
    required super.description,
    required super.pExpireDateTime,
    required super.pCreateDateTime,
    required super.count,
    required super.originalPrice,
    required super.discountedPrice,
    required super.discount,
    required super.categoryId,
    required super.subCategoryId,
    required super.subCategoryItemId,
    required super.provinceId,
    required super.cityId,
    required super.contactNumber,
    required super.showContactInfo,
  });

  factory CreateAdvertisementModel.fromJson(Map<String, dynamic> json) =>
      _$CreateAdvertisementModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateAdvertisementModelToJson(this);
}
