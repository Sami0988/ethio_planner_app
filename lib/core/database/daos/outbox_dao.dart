import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables.dart';

part 'outbox_dao.g.dart';

@DriftAccessor(tables: [OutboxOperations])
class OutboxDao extends DatabaseAccessor<AppDatabase> with _$OutboxDaoMixin {
  OutboxDao(super.db);

  /// Enqueue a new outbox operation.
  Future<void> enqueue({
    required String id,
    required String entityType,
    required String entityId,
    required String operationType,
    String? payload,
    String? accountId,
  }) async {
    await into(outboxOperations).insert(
      OutboxOperationsCompanion.insert(
        id: id,
        entityType: entityType,
        entityId: entityId,
        operationType: operationType,
        payload: Value.absentIfNull(payload),
        createdAt: DateTime.now(),
        accountId: Value.absentIfNull(accountId),
      ),
    );
  }

  /// Get all pending operations, oldest first.
  Future<List<OutboxOperation>> getPendingOperations() {
    return (select(
      outboxOperations,
    )..orderBy([(t) => OrderingTerm.asc(t.createdAt)])).get();
  }

  /// Watch pending operations (for UI badge / sync indicator).
  Stream<List<OutboxOperation>> watchPendingOperations() {
    return (select(outboxOperations)
          ..where((t) => t.lastError.isNull())
          ..orderBy([(t) => OrderingTerm.asc(t.createdAt)]))
        .watch();
  }

  /// Count of pending operations.
  Stream<int> watchPendingCount() {
    final count = outboxOperations.id.count();
    final query = selectOnly(outboxOperations)
      ..addColumns([count])
      ..where(outboxOperations.lastError.isNull());
    return query.watchSingle().map((row) => row.read(count)!);
  }

  /// Mark an operation as failed with a retry.
  Future<void> markFailed({required String id, required String error}) async {
    await (update(outboxOperations)..where((t) => t.id.equals(id))).write(
      OutboxOperationsCompanion(
        lastError: Value(error),
        lastAttemptAt: Value(DateTime.now()),
        retryCount: const Value(1),
      ),
    );
  }

  /// Increment retry count on failure.
  Future<void> incrementRetry(String id) async {
    final op =
        await (select(outboxOperations)
              ..where((t) => t.id.equals(id))
              ..limit(1))
            .getSingleOrNull();
    if (op != null) {
      await (update(outboxOperations)..where((t) => t.id.equals(id))).write(
        OutboxOperationsCompanion(
          retryCount: Value(op.retryCount + 1),
          lastAttemptAt: Value(DateTime.now()),
        ),
      );
    }
  }

  /// Remove a successfully synced operation.
  Future<void> removeById(String id) async {
    await (delete(outboxOperations)..where((t) => t.id.equals(id))).go();
  }

  /// Remove all operations for an entity (e.g., on permanent delete).
  Future<void> removeByEntityId(String entityId) async {
    await (delete(
      outboxOperations,
    )..where((t) => t.entityId.equals(entityId))).go();
  }

  /// Clear all operations (for account logout).
  Future<void> clearAll() async {
    await delete(outboxOperations).go();
  }

  /// Check if an operation with this ID already exists (idempotency check).
  Future<bool> operationExists(String id) async {
    final result =
        await (select(outboxOperations)
              ..where((t) => t.id.equals(id))
              ..limit(1))
            .getSingleOrNull();
    return result != null;
  }
}
