import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables.dart';

part 'planner_items_dao.g.dart';

@DriftAccessor(tables: [PlannerItems])
class PlannerItemsDao extends DatabaseAccessor<AppDatabase>
    with _$PlannerItemsDaoMixin {
  PlannerItemsDao(AppDatabase db) : super(db);

  Future<int> insertItem(PlannerItemsCompanion item) {
    return into(plannerItems)
        .insert(item, mode: InsertMode.insertOrReplace);
  }

  Future<bool> updateItem(PlannerItemsCompanion item) {
    return update(plannerItems).replace(item);
  }

  Future<int> deleteItem(String id) {
    return (delete(plannerItems)..where((t) => t.id.equals(id))).go();
  }

  Future<PlannerItem?> getItemById(String id) {
    return (select(plannerItems)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Future<List<PlannerItem>> getItemsByDate(DateTime date) {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));
    return (select(plannerItems)
          ..where((t) => t.gcDate.isBetweenValues(start, end))
          ..orderBy([(t) => OrderingTerm.asc(t.gcDate)]))
        .get();
  }

  Future<List<PlannerItem>> getItemsByDateRange(DateTime start, DateTime end) {
    return (select(plannerItems)
          ..where((t) => t.gcDate.isBetweenValues(start, end))
          ..orderBy([(t) => OrderingTerm.asc(t.gcDate)]))
        .get();
  }

  Future<List<PlannerItem>> getAllItems() {
    return (select(plannerItems)
          ..orderBy([(t) => OrderingTerm.asc(t.gcDate)]))
        .get();
  }

  Stream<List<PlannerItem>> watchItemsByDateRange(DateTime start, DateTime end) {
    return (select(plannerItems)
          ..where((t) => t.gcDate.isBetweenValues(start, end))
          ..orderBy([(t) => OrderingTerm.asc(t.gcDate)]))
        .watch();
  }

  Stream<List<PlannerItem>> watchAllItems() {
    return (select(plannerItems)
          ..orderBy([(t) => OrderingTerm.asc(t.gcDate)]))
        .watch();
  }
}
