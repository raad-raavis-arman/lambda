import 'package:json_annotation/json_annotation.dart';
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
    required super.category,
    required super.subCategory,
    required super.province,
    required super.city,
  });

  factory AdvertisementModel.fromJson(Map<String, dynamic> json) =>
      _$AdvertisementModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdvertisementModelToJson(this);
}
