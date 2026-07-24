import '../entities/planner_item.dart';

abstract class PlannerRepository {
  Future<List<PlannerItem>> getItemsByDate(DateTime date);
  Future<List<PlannerItem>> getItemsByDateRange(DateTime start, DateTime end);
  Future<List<PlannerItem>> getAllItems();
  Future<PlannerItem?> getItemById(String id);
  Future<void> createItem(PlannerItem item);
  Future<void> updateItem(PlannerItem item);
  Future<void> deleteItem(String id);
  Future<void> reorderItems(List<PlannerItem> items);
  Stream<List<PlannerItem>> watchItemsByDateRange(
      DateTime start, DateTime end);
}
