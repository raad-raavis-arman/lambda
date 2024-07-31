import 'dart:convert';

import 'package:equatable/equatable.dart';

class AdvertisementQuery extends Equatable {
  const AdvertisementQuery({
    this.query = '',
    this.offset = 0,
    this.limit = 10,
    this.cityIds = const [],
  });

  final String query;
  final int limit;
  final int offset;
  final List<int> cityIds;

  Map<String, dynamic> toJson() => {
        'offset': offset,
        'limit': limit,
        if (query.isNotEmpty) 'query': query,
        if (cityIds.isNotEmpty) 'city_ids': jsonEncode(cityIds),
      };

  @override
  List<Object?> get props => [
        query,
        limit,
        offset,
      ];
}
