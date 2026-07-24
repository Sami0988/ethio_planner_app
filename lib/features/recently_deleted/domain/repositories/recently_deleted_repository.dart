enum DeletedEntityType { event, reminder, plannerItem, note }

class DeletedItem {
  final String id;
  final DeletedEntityType entityType;
  final String entityId;
  final String entityTitle;
  final DateTime deletedAt;
  final String entityData;

  const DeletedItem({
    required this.id,
    required this.entityType,
    required this.entityId,
    required this.entityTitle,
    required this.deletedAt,
    required this.entityData,
  });

  int get daysRemaining {
    final retention = const Duration(days: 30);
    final expiresAt = deletedAt.add(retention);
    final now = DateTime.now();
    if (now.isAfter(expiresAt)) return 0;
    return expiresAt.difference(now).inDays;
  }
}

abstract class RecentlyDeletedRepository {
  Future<List<DeletedItem>> getAllRecentlyDeleted();
  Future<void> restoreItem(DeletedItem item);
  Future<void> permanentlyDelete(String id);
}
