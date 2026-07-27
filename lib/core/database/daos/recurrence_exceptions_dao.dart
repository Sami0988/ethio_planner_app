import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables.dart';

part 'recurrence_exceptions_dao.g.dart';

@DriftAccessor(tables: [RecurrenceExceptions])
class RecurrenceExceptionsDao extends DatabaseAccessor<AppDatabase>
    with _$RecurrenceExceptionsDaoMixin {
  RecurrenceExceptionsDao(super.db);

  /// Insert or update an exception for a specific occurrence.
  Future<int> upsertException(RecurrenceExceptionsCompanion exception) {
    return into(
      recurrenceExceptions,
    ).insert(exception, mode: InsertMode.insertOrReplace);
  }

  /// Get all exceptions for a specific entity (event or reminder).
  Future<List<RecurrenceException>> getExceptionsForEntity(
    String entityId,
    String entityType,
  ) {
    final query = select(recurrenceExceptions)
      ..where(
        (t) => t.entityId.equals(entityId) & t.entityType.equals(entityType),
      )
      ..where((t) => t.deletedAt.isNull());
    return query.get();
  }

  /// Get all exception keys for an entity (for fast lookup during expansion).
  Future<Set<String>> getExceptionKeysForEntity(
    String entityId,
    String entityType,
  ) async {
    final exceptions = await getExceptionsForEntity(entityId, entityType);
    return exceptions.map((e) => e.exceptionKey).toSet();
  }

  /// Get skipped exception keys for an entity.
  Future<Set<String>> getSkippedKeys(String entityId, String entityType) async {
    final query = select(recurrenceExceptions)
      ..where(
        (t) =>
            t.entityId.equals(entityId) &
            t.entityType.equals(entityType) &
            t.exceptionType.equals('skipped') &
            t.deletedAt.isNull(),
      );
    final results = await query.get();
    return results.map((e) => e.exceptionKey).toSet();
  }

  /// Get modified occurrences map (exceptionKey → modifiedGcDate).
  Future<Map<String, DateTime>> getModifiedDates(
    String entityId,
    String entityType,
  ) async {
    final query = select(recurrenceExceptions)
      ..where(
        (t) =>
            t.entityId.equals(entityId) &
            t.entityType.equals(entityType) &
            t.exceptionType.equals('modified') &
            t.deletedAt.isNull(),
      );
    final results = await query.get();
    return {
      for (final r in results)
        if (r.modifiedGcDate != null) r.exceptionKey: r.modifiedGcDate!,
    };
  }

  /// Get all exceptions across all entities (for batch expansion).
  Future<List<RecurrenceException>> getAllExceptions() {
    final query = select(recurrenceExceptions)
      ..where((t) => t.deletedAt.isNull());
    return query.get();
  }

  /// Delete an exception by ID (soft delete).
  Future<void> deleteException(String id) {
    return (update(recurrenceExceptions)..where((t) => t.id.equals(id))).write(
      RecurrenceExceptionsCompanion(deletedAt: Value(DateTime.now())),
    );
  }

  /// Hard delete all exceptions for an entity (used when deleting the series).
  Future<void> deleteAllForEntity(String entityId, String entityType) {
    return (delete(recurrenceExceptions)..where(
          (t) => t.entityId.equals(entityId) & t.entityType.equals(entityType),
        ))
        .go();
  }

  /// Get exception by key.
  Future<RecurrenceException?> getByKey(String exceptionKey) {
    final query = select(recurrenceExceptions)
      ..where((t) => t.exceptionKey.equals(exceptionKey))
      ..limit(1);
    return query.getSingleOrNull();
  }

  /// Watch all active exceptions (for real-time expansion).
  Stream<List<RecurrenceException>> watchAllExceptions() {
    final query = select(recurrenceExceptions)
      ..where((t) => t.deletedAt.isNull());
    return query.watch();
  }
}
