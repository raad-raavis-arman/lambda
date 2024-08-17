import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:landa/screens/shared/domain/advertisements/entities/entities.dart';

class Advertisement extends Equatable {
  const Advertisement({
    required this.id,
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
    required this.isMarked,
    required this.status,
  });

  final int id;
  final String? description;
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
  final bool isMarked;
  final int status;

  Advertisement copyWith({
    int? id,
    String? description,
    String? adCreateDateTime,
    String? adExpireDateTime,
    String? pCreateDateTime,
    String? pExpireDateTime,
    double? originalPrice,
    double? discountedPrice,
    double? discount,
    int? count,
    String? contactNumber,
    bool? showContactInfo,
    Category? category,
    SubCategory? subCategory,
    Province? province,
    City? city,
    bool? isMarked,
    int? status,
  }) {
    return Advertisement(
      id: id ?? this.id,
      description: description ?? this.description,
      adCreateDateTime: adCreateDateTime ?? this.adCreateDateTime,
      adExpireDateTime: adExpireDateTime ?? this.adExpireDateTime,
      pCreateDateTime: pCreateDateTime ?? this.pCreateDateTime,
      pExpireDateTime: pExpireDateTime ?? this.pExpireDateTime,
      originalPrice: originalPrice ?? this.originalPrice,
      discountedPrice: discountedPrice ?? this.discountedPrice,
      discount: discount ?? this.discount,
      count: count ?? this.count,
      contactNumber: contactNumber ?? this.contactNumber,
      showContactInfo: showContactInfo ?? this.showContactInfo,
      category: category ?? this.category,
      subCategory: subCategory ?? this.subCategory,
      province: province ?? this.province,
      city: city ?? this.city,
      isMarked: isMarked ?? this.isMarked,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        id,
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
        isMarked,
      ];
}
