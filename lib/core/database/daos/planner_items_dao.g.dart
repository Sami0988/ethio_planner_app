// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planner_items_dao.dart';

// ignore_for_file: type=lint
mixin _$PlannerItemsDaoMixin on DatabaseAccessor<AppDatabase> {
  $PlannerItemsTable get plannerItems => attachedDatabase.plannerItems;
  PlannerItemsDaoManager get managers => PlannerItemsDaoManager(this);
}

class PlannerItemsDaoManager {
  final _$PlannerItemsDaoMixin _db;
  PlannerItemsDaoManager(this._db);
  $$PlannerItemsTableTableManager get plannerItems =>
      $$PlannerItemsTableTableManager(_db.attachedDatabase, _db.plannerItems);
}
