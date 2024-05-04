import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class CreateAdvertisement extends Equatable {
  const CreateAdvertisement({
    required this.pType,
    required this.description,
    required this.pExpireDateTime,
    required this.pCreateDateTime,
    required this.count,
    required this.originalPrice,
    required this.discountedPrice,
    required this.discount,
    required this.categoryId,
    required this.subCategoryId,
    required this.provinceId,
    required this.cityId,
    required this.contactNumber,
    required this.showContactInfo,
  });

  @JsonKey(name: 'p_type')
  final int pType;
  final String description;
  @JsonKey(name: 'p_expire_date_time')
  final String pExpireDateTime;
  @JsonKey(name: 'p_create_date_time')
  final String pCreateDateTime;
  final int count;
  @JsonKey(name: 'original_price')
  final double originalPrice;
  @JsonKey(name: 'discounted_price')
  final double discountedPrice;
  final double discount;
  @JsonKey(name: 'category_id')
  final int categoryId;
  @JsonKey(name: 'sub_category_id')
  final int subCategoryId;
  @JsonKey(name: 'province_id')
  final int provinceId;
  @JsonKey(name: 'city_id')
  final int cityId;
  @JsonKey(name: 'contact_number')
  final String contactNumber;
  @JsonKey(name: 'show_contact_info')
  final bool showContactInfo;

  @override
  List<Object?> get props => [
        pType,
        description,
        pExpireDateTime,
        pCreateDateTime,
        count,
        originalPrice,
        discountedPrice,
        discount,
        categoryId,
        subCategoryId,
        provinceId,
        cityId,
        contactNumber,
        showContactInfo,
      ];
}
