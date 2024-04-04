import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:landa/screens/advertisement_area/domain/entities/entities.dart';
import 'package:landa/screens/advertisement_category/domain/entities/entities.dart';

class Advertisement extends Equatable {
  const Advertisement({
    required this.id,
    required this.title,
    required this.description,
    required this.adCreateDateTime,
    required this.adExpireDateTime,
    required this.pCreateDateTime,
    required this.pExpireDateTime,
    required this.originalPrice,
    required this.discountedPrice,
    required this.discount,
    required this.count,
    required this.contactNumber,
    required this.showContactInfo,
    required this.category,
    required this.subCategory,
    required this.province,
    required this.city,
  });

  final int id;
  final String title;
  final String description;
  @JsonKey(name: 'ad_create_date_time')
  final String adCreateDateTime;
  @JsonKey(name: 'ad_expire_date_time')
  final String adExpireDateTime;
  @JsonKey(name: 'p_create_date_time')
  final String pCreateDateTime;
  @JsonKey(name: 'p_expire_date_time')
  final String pExpireDateTime;
  @JsonKey(name: 'original_price')
  final double originalPrice;
  @JsonKey(name: 'discounted_price')
  final double discountedPrice;
  final double discount;
  final int count;
  @JsonKey(name: 'contact_number')
  final String contactNumber;
  @JsonKey(name: 'show_contact_info')
  final bool showContactInfo;
  final Category category;
  @JsonKey(name: 'sub_category')
  final SubCategory subCategory;
  final Province province;
  final City city;

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        adCreateDateTime,
        adExpireDateTime,
        pCreateDateTime,
        pExpireDateTime,
        originalPrice,
        discountedPrice,
        discount,
        count,
        contactNumber,
        showContactInfo,
        category,
        subCategory,
        province,
        city,
      ];
}
