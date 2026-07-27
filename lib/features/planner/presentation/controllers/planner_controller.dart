import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/providers/calendar_settings_provider.dart';
import '../../../../core/recently_deleted/soft_delete_provider.dart';
import '../../../../core/recently_deleted/soft_delete_service.dart';
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
  SoftDeleteService get _softDeleteService =>
      ref.read(softDeleteServiceProvider);

  Future<void> loadItems() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final items = await _getItemsForCurrentRange();
      state = state.copyWith(items: items, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  Future<List<PlannerItem>> _getItemsForCurrentRange() async {
    switch (state.viewMode) {
      case PlannerViewMode.day:
        return _getItemsByDate(state.selectedDate);
      case PlannerViewMode.week:
        return _getItemsForWeek(state.selectedDate);
      case PlannerViewMode.month:
        return _getItemsForMonth(state.selectedDate);
      case PlannerViewMode.year:
        return _getItemsForYear(state.selectedDate);
    }
  }

  Future<List<PlannerItem>> _getItemsForWeek(DateTime date) async {
    final weekStartDay = ref.read(calendarSettingsProvider).weekStartDay;
    final daysToSubtract = (date.weekday - weekStartDay) % 7;
    final startOfWeek = date.subtract(Duration(days: daysToSubtract));
    final allItems = <PlannerItem>[];
    for (var i = 0; i <= 6; i++) {
      final day = startOfWeek.add(Duration(days: i));
      final items = await _getItemsByDate(day);
      allItems.addAll(items);
    }
    return allItems;
  }

  Future<List<PlannerItem>> _getItemsForMonth(DateTime date) async {
    final startOfMonth = DateTime(date.year, date.month);
    final allItems = <PlannerItem>[];
    for (var day = startOfMonth; !day.isAfter(DateTime(date.year, date.month + 1, 0)); day = day.add(const Duration(days: 1))) {
      final items = await _getItemsByDate(day);
      allItems.addAll(items);
    }
    return allItems;
  }

  Future<List<PlannerItem>> _getItemsForYear(DateTime date) async {
    final allItems = <PlannerItem>[];
    for (var month = 1; month <= 12; month++) {
      for (var day = DateTime(date.year, month); !day.isAfter(DateTime(date.year, month + 1, 0)); day = day.add(const Duration(days: 1))) {
        final items = await _getItemsByDate(day);
        allItems.addAll(items);
      }
    }
    return allItems;
  }

  Future<void> selectDate(DateTime date) async {
    state = state.copyWith(selectedDate: date);
    await loadItems();
  }

  Future<void> goToPreviousDay() async {
    final newDate = _navigate(state.viewMode, state.selectedDate, false);
    state = state.copyWith(selectedDate: newDate);
    await loadItems();
  }

  Future<void> goToNextDay() async {
    final newDate = _navigate(state.viewMode, state.selectedDate, true);
    state = state.copyWith(selectedDate: newDate);
    await loadItems();
  }

  DateTime _navigate(PlannerViewMode mode, DateTime date, bool forward) {
    final delta = forward ? 1 : -1;
    switch (mode) {
      case PlannerViewMode.day:
        return date.add(Duration(days: delta));
      case PlannerViewMode.week:
        return date.add(Duration(days: 7 * delta));
      case PlannerViewMode.month:
        return DateTime(date.year, date.month + delta);
      case PlannerViewMode.year:
        return DateTime(date.year + delta);
    }
  }

  void setViewMode(PlannerViewMode mode) {
    state = state.copyWith(viewMode: mode);
    loadItems();
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
    await _softDeleteService.softDeletePlannerItem(id);
    await loadItems();
  }

  Future<void> toggleCompleted(String id) async {
    final item = state.items.firstWhere((i) => i.id == id);
    await _updateItem(item.copyWith(isCompleted: !item.isCompleted));
    await loadItems();
  }

  List<PlannerItem> getItemsForSection(PlannerSection section) {
    if (state.hiddenSections.contains(section)) return [];
    return state.items.where((i) => i.section == section).toList()
      ..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
  }

  void toggleSectionVisibility(PlannerSection section) {
    final hidden = List<PlannerSection>.from(state.hiddenSections);
    if (hidden.contains(section)) {
      hidden.remove(section);
    } else {
      hidden.add(section);
    }
    state = state.copyWith(hiddenSections: hidden);
  }

  Future<void> reorderItems(String itemId, int oldIndex, int newIndex) async {
    final item = state.items.firstWhere((i) => i.id == itemId);
    await _updateItem(item.copyWith(sortOrder: newIndex));
    await loadItems();
  }

  Future<int> copyFromPreviousPeriod() async {
    final previousDate = _navigate(state.viewMode, state.selectedDate, false);
    final previousItems = await _getItemsForDate(previousDate);
    if (previousItems.isEmpty) return 0;

    final currentItems = await _getItemsForCurrentRange();
    final currentTitles = currentItems.map((i) => i.title.toLowerCase()).toSet();
    final now = clock.now();
    var copied = 0;

    for (final item in previousItems) {
      if (currentTitles.contains(item.title.toLowerCase())) continue;
      final newItem = PlannerItem(
        id: _uuid.v4(),
        title: item.title,
        ecDate: item.ecDate,
        gcDate: now,
        description: item.description,
        section: item.section,
        sortOrder: item.sortOrder,
      );
      await _createItem(newItem);
      copied++;
    }
    await loadItems();
    return copied;
  }

  Future<int> carryForwardIncomplete() async {
    final previousDate = _navigate(state.viewMode, state.selectedDate, false);
    final previousItems = await _getItemsForDate(previousDate);
    final incompleteItems = previousItems.where((i) => !i.isCompleted).toList();
    if (incompleteItems.isEmpty) return 0;

    final currentItems = await _getItemsForCurrentRange();
    final currentTitles = currentItems.map((i) => i.title.toLowerCase()).toSet();
    final now = clock.now();
    var carried = 0;

    for (final item in incompleteItems) {
      if (currentTitles.contains(item.title.toLowerCase())) continue;
      final newItem = PlannerItem(
        id: _uuid.v4(),
        title: item.title,
        ecDate: item.ecDate,
        gcDate: now,
        description: item.description,
        section: item.section,
        sortOrder: item.sortOrder,
      );
      await _createItem(newItem);
      carried++;
    }
    await loadItems();
    return carried;
  }

  Future<List<PlannerItem>> _getItemsForDate(DateTime date) async {
    return _getItemsByDate(date);
  }

  String getPeriodLabel() {
    switch (state.viewMode) {
      case PlannerViewMode.day:
        return '${state.selectedDate.day}/${state.selectedDate.month}/${state.selectedDate.year}';
      case PlannerViewMode.week:
        final start = state.selectedDate.subtract(Duration(days: state.selectedDate.weekday - 1));
        final end = start.add(const Duration(days: 6));
        return '${start.day}/${start.month} – ${end.day}/${end.month}';
      case PlannerViewMode.month:
        return '${state.selectedDate.month}/${state.selectedDate.year}';
      case PlannerViewMode.year:
        return '${state.selectedDate.year}';
    }
  }
}
