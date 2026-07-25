enum SearchResultType { event, reminder, plannerItem, note }

class SearchResult {
  final String id;
  final String title;
  final String? subtitle;
  final SearchResultType type;
  final DateTime? date;
  final String? category;

  const SearchResult({
    required this.id,
    required this.title,
    this.subtitle,
    required this.type,
    this.date,
    this.category,
  });
}

class SearchDateRange {
  final DateTime start;
  final DateTime end;

  const SearchDateRange({required this.start, required this.end});
}

class SearchFilters {
  final Set<SearchResultType>? types;
  final SearchDateRange? dateRange;
  final String? category;

  const SearchFilters({
    this.types,
    this.dateRange,
    this.category,
  });

  SearchFilters copyWith({
    Set<SearchResultType>? types,
    SearchDateRange? dateRange,
    String? category,
    bool clearDateRange = false,
    bool clearCategory = false,
  }) {
    return SearchFilters(
      types: types ?? this.types,
      dateRange: clearDateRange ? null : (dateRange ?? this.dateRange),
      category: clearCategory ? null : (category ?? this.category),
    );
  }
}

abstract class SearchRepository {
  Future<List<SearchResult>> search(String query, {SearchFilters? filters});
}
