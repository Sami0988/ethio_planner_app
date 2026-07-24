import '../entities/planner_item.dart';
import '../repositories/planner_repository.dart';

class GetPlannerItemsByDate {
  final PlannerRepository _repository;

  GetPlannerItemsByDate(this._repository);

  Future<List<PlannerItem>> call(DateTime date) async {
    return _repository.getItemsByDate(date);
  }
}

class GetPlannerItemsByDateRange {
  final PlannerRepository _repository;

  GetPlannerItemsByDateRange(this._repository);

  Future<List<PlannerItem>> call(DateTime start, DateTime end) async {
    return _repository.getItemsByDateRange(start, end);
  }
}

class CreatePlannerItem {
  final PlannerRepository _repository;

  CreatePlannerItem(this._repository);

  Future<void> call(PlannerItem item) async {
    await _repository.createItem(item);
  }
}

class UpdatePlannerItem {
  final PlannerRepository _repository;

  UpdatePlannerItem(this._repository);

  Future<void> call(PlannerItem item) async {
    await _repository.updateItem(item);
  }
}

class DeletePlannerItem {
  final PlannerRepository _repository;

  DeletePlannerItem(this._repository);

  Future<void> call(String id) async {
    await _repository.deleteItem(id);
  }
}

class ReorderPlannerItems {
  final PlannerRepository _repository;

  ReorderPlannerItems(this._repository);

  Future<void> call(List<PlannerItem> items) async {
    await _repository.reorderItems(items);
  }
}
