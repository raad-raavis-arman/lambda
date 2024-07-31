import 'package:equatable/equatable.dart';

class SearchableListEntity extends Equatable {
  const SearchableListEntity({
    required this.title,
    required this.value,
    this.iconUrl,
    this.showTrailingArrow = true,
  });

  final String title;
  final String? iconUrl;
  final bool showTrailingArrow;
  final dynamic value;

  @override
  List<Object?> get props => [
        title,
        iconUrl,
      ];
}
