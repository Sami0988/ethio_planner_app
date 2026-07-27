import 'dart:convert';
import '../database/app_database.dart';

class SoftDeleteService {
  final AppDatabase _database;

  SoftDeleteService(this._database);

  Future<void> softDeleteEvent(String id) async {
    final event = await _database.calendarEventsDao.getEventById(id);
    if (event == null) return;

    final data = {
      'title': event.title,
      'ec_date': event.ecDate.toIso8601String(),
      'gc_date': event.gcDate.toIso8601String(),
      'description': event.description,
      'is_all_day': event.isAllDay,
      'category': event.category,
      'location': event.location,
      'recurrence_rule': event.recurrenceRule,
    };

    await _database.recentlyDeletedDao.addToRecentlyDeleted(
      entityType: 'event',
      entityId: event.id,
      entityTitle: event.title,
      entityData: jsonEncode(data),
    );
    await _database.calendarEventsDao.deleteEvent(id);
  }

  Future<void> softDeleteReminder(String id) async {
    final reminder = await _database.remindersDao.getReminderById(id);
    if (reminder == null) return;

    final data = {
      'title': reminder.title,
      'ec_date': reminder.ecDate.toIso8601String(),
      'gc_date': reminder.gcDate.toIso8601String(),
      'description': reminder.description,
      'is_completed': reminder.isCompleted,
      'recurrence_rule': reminder.recurrenceRule,
    };

    await _database.recentlyDeletedDao.addToRecentlyDeleted(
      entityType: 'reminder',
      entityId: reminder.id,
      entityTitle: reminder.title,
      entityData: jsonEncode(data),
    );
    await _database.remindersDao.deleteReminder(id);
  }

  Future<void> softDeletePlannerItem(String id) async {
    final item = await _database.plannerItemsDao.getItemById(id);
    if (item == null) return;

    final data = {
      'title': item.title,
      'ec_date': item.ecDate.toIso8601String(),
      'gc_date': item.gcDate.toIso8601String(),
      'description': item.description,
      'section': item.section,
      'sort_order': item.sortOrder,
      'is_completed': item.isCompleted,
    };

    await _database.recentlyDeletedDao.addToRecentlyDeleted(
      entityType: 'planner_item',
      entityId: item.id,
      entityTitle: item.title,
      entityData: jsonEncode(data),
    );
    await _database.plannerItemsDao.deleteItem(id);
  }

  Future<void> softDeleteNote(String id) async {
    final notes = await (_database.select(_database.notes)
      ..where((t) => t.id.equals(id)))
        .get();
    if (notes.isEmpty) return;
    final note = notes.first;

    final data = {
      'title': note.title,
      'content': note.content,
      'created_at': note.createdAt.toIso8601String(),
      'updated_at': note.updatedAt.toIso8601String(),
      'is_pinned': note.isPinned,
      'is_archived': note.isArchived,
      'category': note.category,
      'linked_event_id': note.linkedEventId,
      'linked_reminder_id': note.linkedReminderId,
      'linked_planner_item_id': note.linkedPlannerItemId,
    };

    await _database.recentlyDeletedDao.addToRecentlyDeleted(
      entityType: 'note',
      entityId: note.id,
      entityTitle: note.title,
      entityData: jsonEncode(data),
    );
    await _database.notesDao.deleteNote(id);
  }
}
