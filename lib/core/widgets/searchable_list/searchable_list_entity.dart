class SearchableListEntity {
  const SearchableListEntity({
    required this.title,
    this.iconUrl,
    this.showTrailingArrow = true,
  });

  final String title;
  final String? iconUrl;
  final bool showTrailingArrow;
}
