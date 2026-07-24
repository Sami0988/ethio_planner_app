import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../domain/entities/planner_item.dart' show PlannerSection;
import '../models/planner_item_model.dart';

class PlannerLocalDatasource {
  final AppDatabase _database;

  PlannerLocalDatasource(this._database);

  Future<List<PlannerItemModel>> getItemsByDate(DateTime date) async {
    final items = await _database.plannerItemsDao.getItemsByDate(date);
    return items.map(_toModel).toList();
  }

  Future<List<PlannerItemModel>> getItemsByDateRange(
    DateTime start,
    DateTime end,
  ) async {
    final items = await _database.plannerItemsDao.getItemsByDateRange(
      start,
      end,
    );
    return items.map(_toModel).toList();
  }

  Future<List<PlannerItemModel>> getAllItems() async {
    final items = await _database.plannerItemsDao.getAllItems();
    return items.map(_toModel).toList();
  }

  Future<PlannerItemModel?> getItemById(String id) async {
    final item = await _database.plannerItemsDao.getItemById(id);
    return item != null ? _toModel(item) : null;
  }

  Future<void> insertItem(PlannerItemModel item) async {
    await _database.plannerItemsDao.insertItem(_toCompanion(item));
  }

  Future<void> updateItem(PlannerItemModel item) async {
    await _database.plannerItemsDao.updateItem(_toCompanion(item));
  }

  Future<void> deleteItem(String id) async {
    await _database.plannerItemsDao.deleteItem(id);
  }

  Stream<List<PlannerItemModel>> watchItemsByDateRange(
    DateTime start,
    DateTime end,
  ) {
    return _database.plannerItemsDao
        .watchItemsByDateRange(start, end)
        .map((items) => items.map(_toModel).toList());
  }

  PlannerItemModel _toModel(PlannerItem item) {
    return PlannerItemModel(
      id: item.id,
      title: item.title,
      ecDate: item.ecDate,
      gcDate: item.gcDate,
      description: item.description,
      isCompleted: item.isCompleted,
      section: PlannerSection.values.byName(item.section).toModel(),
      sortOrder: item.sortOrder,
      linkedEventId: item.linkedEventId,
      linkedReminderId: item.linkedReminderId,
    );
  }

  PlannerItemsCompanion _toCompanion(PlannerItemModel item) {
    return PlannerItemsCompanion(
      id: Value(item.id),
      title: Value(item.title),
      ecDate: Value(item.ecDate),
      gcDate: Value(item.gcDate),
      description: Value(item.description),
    );
  }
}
