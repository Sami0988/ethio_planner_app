import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../domain/entities/planner_item.dart';
import '../../domain/usecases/get_planner_items.dart';
import '../providers/planner_providers.dart';
import '../providers/planner_view_state.dart';

const _uuid = Uuid();

class PlannerController extends Notifier<PlannerViewState> {
  @override
  PlannerViewState build() {
    final now = clock.now();
    return PlannerViewState(
      selectedDate: DateTime(now.year, now.month, now.day),
    );
  }

  GetPlannerItemsByDate get _getItemsByDate =>
      ref.read(getPlannerItemsByDateProvider);
  CreatePlannerItem get _createItem => ref.read(createPlannerItemProvider);
  UpdatePlannerItem get _updateItem => ref.read(updatePlannerItemProvider);
  DeletePlannerItem get _deleteItem => ref.read(deletePlannerItemProvider);

  Future<void> loadItems() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final items = await _getItemsByDate(state.selectedDate);
      state = state.copyWith(items: items, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  Future<void> selectDate(DateTime date) async {
    state = state.copyWith(selectedDate: date);
    await loadItems();
  }

  Future<void> goToPreviousDay() async {
    final newDate = state.selectedDate.subtract(const Duration(days: 1));
    state = state.copyWith(selectedDate: newDate);
    await loadItems();
  }

  Future<void> goToNextDay() async {
    final newDate = state.selectedDate.add(const Duration(days: 1));
    state = state.copyWith(selectedDate: newDate);
    await loadItems();
  }

  void setViewMode(PlannerViewMode mode) {
    state = state.copyWith(viewMode: mode);
  }

  Future<void> createItem({
    required String title,
    required DateTime ecDate,
    required DateTime gcDate,
    String? description,
    PlannerSection section = PlannerSection.focus,
  }) async {
    final item = PlannerItem(
      id: _uuid.v4(),
      title: title,
      ecDate: ecDate,
      gcDate: gcDate,
      description: description,
      section: section,
      sortOrder: state.items.length,
    );
    await _createItem(item);
    await loadItems();
  }

  Future<void> updateItem(PlannerItem item) async {
    await _updateItem(item);
    await loadItems();
  }

  Future<void> deleteItem(String id) async {
    await _deleteItem(id);
    await loadItems();
  }

  Future<void> toggleCompleted(String id) async {
    final item = state.items.firstWhere((i) => i.id == id);
    await _updateItem(item.copyWith(isCompleted: !item.isCompleted));
    await loadItems();
  }

  List<PlannerItem> getItemsForSection(PlannerSection section) {
    return state.items.where((i) => i.section == section).toList()
      ..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
  }
}
