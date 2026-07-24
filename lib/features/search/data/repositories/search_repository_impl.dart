import 'package:drift/drift.dart';
import '../../../../core/database/app_database.dart';
import '../../domain/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final AppDatabase _database;

  SearchRepositoryImpl(this._database);

  @override
  Future<List<SearchResult>> search(String query) async {
    if (query.trim().isEmpty) return [];

    final lowerQuery = '%${query.toLowerCase()}%';
    final results = <SearchResult>[];

    // Search calendar events
    final events =
        await (_database.select(_database.calendarEvents)
              ..where(
                (t) =>
                    t.title.like(lowerQuery) | t.description.like(lowerQuery),
              )
              ..limit(20))
            .get();
    for (final event in events) {
      results.add(
        SearchResult(
          id: event.id,
          title: event.title,
          subtitle: event.description,
          type: SearchResultType.event,
          date: event.gcDate,
          category: event.category,
        ),
      );
    }

    // Search reminders
    final reminders =
        await (_database.select(_database.reminders)
              ..where(
                (t) =>
                    t.title.like(lowerQuery) | t.description.like(lowerQuery),
              )
              ..limit(20))
            .get();
    for (final reminder in reminders) {
      results.add(
        SearchResult(
          id: reminder.id,
          title: reminder.title,
          subtitle: reminder.description,
          type: SearchResultType.reminder,
          date: reminder.gcDate,
        ),
      );
    }

    // Search planner items
    final plannerItems =
        await (_database.select(_database.plannerItems)
              ..where(
                (t) =>
                    t.title.like(lowerQuery) | t.description.like(lowerQuery),
              )
              ..limit(20))
            .get();
    for (final item in plannerItems) {
      results.add(
        SearchResult(
          id: item.id,
          title: item.title,
          subtitle: item.description,
          type: SearchResultType.plannerItem,
          date: item.gcDate,
        ),
      );
    }

    // Search notes
    final notes =
        await (_database.select(_database.notes)
              ..where(
                (t) => t.title.like(lowerQuery) | t.content.like(lowerQuery),
              )
              ..limit(20))
            .get();
    for (final note in notes) {
      results.add(
        SearchResult(
          id: note.id,
          title: note.title,
          subtitle: note.content,
          type: SearchResultType.note,
          date: note.updatedAt,
          category: note.category,
        ),
      );
    }

    // Sort by relevance (title matches first, then by date)
    results.sort((a, b) {
      final aTitleMatch = a.title.toLowerCase().contains(query.toLowerCase());
      final bTitleMatch = b.title.toLowerCase().contains(query.toLowerCase());
      if (aTitleMatch && !bTitleMatch) return -1;
      if (!aTitleMatch && bTitleMatch) return 1;
      if (a.date != null && b.date != null) {
        return b.date!.compareTo(a.date!);
      }
      return 0;
    });

    return results;
  }
}
