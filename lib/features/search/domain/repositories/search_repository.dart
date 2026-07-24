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

abstract class SearchRepository {
  Future<List<SearchResult>> search(String query);
}
