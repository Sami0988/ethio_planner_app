import '../../domain/entities/planner_item.dart';
import '../../domain/repositories/planner_repository.dart';
import '../datasources/planner_local_datasource.dart';
import '../models/planner_item_model.dart';

class PlannerRepositoryImpl implements PlannerRepository {
  final PlannerLocalDatasource localDatasource;

  PlannerRepositoryImpl({
    required this.localDatasource,
  });

  @override
  Future<List<PlannerItem>> getItemsByDate(DateTime date) async {
    final models = await localDatasource.getItemsByDate(date);
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<List<PlannerItem>> getItemsByDateRange(
      DateTime start, DateTime end) async {
    final models = await localDatasource.getItemsByDateRange(start, end);
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<List<PlannerItem>> getAllItems() async {
    final models = await localDatasource.getAllItems();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<PlannerItem?> getItemById(String id) async {
    final model = await localDatasource.getItemById(id);
    return model?.toEntity();
  }

  @override
  Future<void> createItem(PlannerItem item) async {
    final model = PlannerItemModel(
      id: item.id,
      title: item.title,
      ecDate: item.ecDate,
      gcDate: item.gcDate,
      description: item.description,
      isCompleted: item.isCompleted,
      section: item.section.toModel(),
      sortOrder: item.sortOrder,
      linkedEventId: item.linkedEventId,
      linkedReminderId: item.linkedReminderId,
    );
    await localDatasource.insertItem(model);
  }

  @override
  Future<void> updateItem(PlannerItem item) async {
    final model = PlannerItemModel(
      id: item.id,
      title: item.title,
      ecDate: item.ecDate,
      gcDate: item.gcDate,
      description: item.description,
      isCompleted: item.isCompleted,
      section: item.section.toModel(),
      sortOrder: item.sortOrder,
      linkedEventId: item.linkedEventId,
      linkedReminderId: item.linkedReminderId,
    );
    await localDatasource.updateItem(model);
  }

  @override
  Future<void> deleteItem(String id) async {
    await localDatasource.deleteItem(id);
  }

  @override
  Future<void> reorderItems(List<PlannerItem> items) async {
    for (var i = 0; i < items.length; i++) {
      final item = items[i].copyWith(sortOrder: i);
      await updateItem(item);
    }
  }

  @override
  Stream<List<PlannerItem>> watchItemsByDateRange(
      DateTime start, DateTime end) {
    return localDatasource
        .watchItemsByDateRange(start, end)
        .map((models) => models.map((m) => m.toEntity()).toList());
  }
}
