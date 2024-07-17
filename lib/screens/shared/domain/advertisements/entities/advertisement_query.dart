import 'package:equatable/equatable.dart';

class AdvertisementQuery extends Equatable {
  const AdvertisementQuery({
    this.query = '',
    this.offset = 0,
    this.limit = 10,
  });

  final String query;
  final int limit;
  final int offset;

  Map<String, dynamic> toJson() => {
        'offset': offset,
        'limit': limit,
        if (query.isNotEmpty) 'query': query,
      };

  @override
  List<Object?> get props => [
        query,
        limit,
        offset,
      ];
}
