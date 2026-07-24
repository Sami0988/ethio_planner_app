import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables.dart';

part 'recently_deleted_dao.g.dart';

@DriftAccessor(tables: [RecentlyDeletedItems])
class RecentlyDeletedDao extends DatabaseAccessor<AppDatabase>
    with _$RecentlyDeletedDaoMixin {
  RecentlyDeletedDao(super.db);

  static const _retentionDays = 30;

  Future<void> addToRecentlyDeleted({
    required String entityType,
    required String entityId,
    required String entityTitle,
    required String entityData,
  }) async {
    await into(recentlyDeletedItems).insert(
      RecentlyDeletedItemsCompanion.insert(
        id: '${entityType}_$entityId',
        entityType: entityType,
        entityId: entityId,
        entityTitle: entityTitle,
        deletedAt: DateTime.now(),
        entityData: entityData,
      ),
      mode: InsertMode.insertOrReplace,
    );
  }

  Future<List<RecentlyDeletedItem>> getAllRecentlyDeleted() async {
    final cutoff = DateTime.now().subtract(
      const Duration(days: _retentionDays),
    );

    // Auto-delete expired items
    await (delete(
      recentlyDeletedItems,
    )..where((t) => t.deletedAt.isSmallerThanValue(cutoff))).go();

    return (select(
      recentlyDeletedItems,
    )..orderBy([(t) => OrderingTerm.desc(t.deletedAt)])).get();
  }

  Future<RecentlyDeletedItem?> getById(String id) async {
    return (select(
      recentlyDeletedItems,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<void> removeFromRecentlyDeleted(String id) async {
    await (delete(recentlyDeletedItems)..where((t) => t.id.equals(id))).go();
  }

  Future<void> permanentDelete(String entityType, String entityId) async {
    final id = '${entityType}_$entityId';
    await (delete(recentlyDeletedItems)..where((t) => t.id.equals(id))).go();
  }
}
