// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recently_deleted_dao.dart';

// ignore_for_file: type=lint
mixin _$RecentlyDeletedDaoMixin on DatabaseAccessor<AppDatabase> {
  $RecentlyDeletedItemsTable get recentlyDeletedItems =>
      attachedDatabase.recentlyDeletedItems;
  RecentlyDeletedDaoManager get managers => RecentlyDeletedDaoManager(this);
}

class RecentlyDeletedDaoManager {
  final _$RecentlyDeletedDaoMixin _db;
  RecentlyDeletedDaoManager(this._db);
  $$RecentlyDeletedItemsTableTableManager get recentlyDeletedItems =>
      $$RecentlyDeletedItemsTableTableManager(
        _db.attachedDatabase,
        _db.recentlyDeletedItems,
      );
}
