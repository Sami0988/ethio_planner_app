import 'dart:convert';
import 'package:drift/drift.dart';
import '../../../../core/database/app_database.dart';
import '../../domain/repositories/recently_deleted_repository.dart';

class RecentlyDeletedRepositoryImpl implements RecentlyDeletedRepository {
  final AppDatabase _database;

  RecentlyDeletedRepositoryImpl(this._database);

  @override
  Future<List<DeletedItem>> getAllRecentlyDeleted() async {
    final items = await _database.recentlyDeletedDao.getAllRecentlyDeleted();
    return items.map((item) {
      final entityType = _parseEntityType(item.entityType);
      return DeletedItem(
        id: item.id,
        entityType: entityType,
        entityId: item.entityId,
        entityTitle: item.entityTitle,
        deletedAt: item.deletedAt,
        entityData: item.entityData,
      );
    }).toList();
  }

  @override
  Future<void> restoreItem(DeletedItem item) async {
    final data = jsonDecode(item.entityData) as Map<String, dynamic>;

    switch (item.entityType) {
      case DeletedEntityType.event:
        await _database.calendarEventsDao.insertEvent(
          CalendarEventsCompanion(
            id: Value(item.entityId),
            title: Value(data['title'] as String),
            ecDate: Value(DateTime.parse(data['ec_date'] as String)),
            gcDate: Value(DateTime.parse(data['gc_date'] as String)),
            description: Value(data['description'] as String?),
            isAllDay: Value(data['is_all_day'] as bool? ?? false),
            category: Value(data['category'] as String?),
            location: Value(data['location'] as String?),
            deletedAt: const Value(null),
          ),
        );
      case DeletedEntityType.reminder:
        await _database.remindersDao.insertReminder(
          RemindersCompanion(
            id: Value(item.entityId),
            title: Value(data['title'] as String),
            ecDate: Value(DateTime.parse(data['ec_date'] as String)),
            gcDate: Value(DateTime.parse(data['gc_date'] as String)),
            description: Value(data['description'] as String?),
            isCompleted: Value(data['is_completed'] as bool? ?? false),
            deletedAt: const Value(null),
          ),
        );
      case DeletedEntityType.plannerItem:
        await _database.plannerItemsDao.insertItem(
          PlannerItemsCompanion(
            id: Value(item.entityId),
            title: Value(data['title'] as String),
            ecDate: Value(DateTime.parse(data['ec_date'] as String)),
            gcDate: Value(DateTime.parse(data['gc_date'] as String)),
            description: Value(data['description'] as String?),
            deletedAt: const Value(null),
          ),
        );
      case DeletedEntityType.note:
        await _database.notesDao.insertNote(
          NotesCompanion(
            id: Value(item.entityId),
            title: Value(data['title'] as String),
            content: Value(data['content'] as String?),
            createdAt: Value(DateTime.parse(data['created_at'] as String)),
            updatedAt: Value(DateTime.parse(data['updated_at'] as String)),
            isPinned: Value(data['is_pinned'] as bool? ?? false),
            category: Value(data['category'] as String?),
            deletedAt: const Value(null),
          ),
        );
    }

    await _database.recentlyDeletedDao.removeFromRecentlyDeleted(item.id);
  }

  @override
  Future<void> permanentlyDelete(String id) async {
    await _database.recentlyDeletedDao.permanentDelete('', '');
    // Actually just remove from the recently deleted table
    await _database.recentlyDeletedDao.removeFromRecentlyDeleted(id);
  }

  DeletedEntityType _parseEntityType(String type) {
    return switch (type) {
      'event' => DeletedEntityType.event,
      'reminder' => DeletedEntityType.reminder,
      'planner_item' => DeletedEntityType.plannerItem,
      'note' => DeletedEntityType.note,
      _ => DeletedEntityType.event,
    };
  }
}
