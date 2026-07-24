import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/database_provider.dart';
import '../../data/datasources/planner_local_datasource.dart';
import '../../data/repositories/planner_repository_impl.dart';
import '../../domain/usecases/get_planner_items.dart';
import '../controllers/planner_controller.dart';
import 'planner_view_state.dart';

final plannerLocalDatasourceProvider = Provider<PlannerLocalDatasource>(
  (ref) => PlannerLocalDatasource(ref.watch(databaseProvider)),
);

final plannerRepositoryProvider = Provider<PlannerRepositoryImpl>(
  (ref) => PlannerRepositoryImpl(
    localDatasource: ref.watch(plannerLocalDatasourceProvider),
  ),
);

final getPlannerItemsByDateProvider = Provider<GetPlannerItemsByDate>(
  (ref) => GetPlannerItemsByDate(ref.watch(plannerRepositoryProvider)),
);

final getPlannerItemsByDateRangeProvider = Provider<GetPlannerItemsByDateRange>(
  (ref) => GetPlannerItemsByDateRange(ref.watch(plannerRepositoryProvider)),
);

final createPlannerItemProvider = Provider<CreatePlannerItem>(
  (ref) => CreatePlannerItem(ref.watch(plannerRepositoryProvider)),
);

final updatePlannerItemProvider = Provider<UpdatePlannerItem>(
  (ref) => UpdatePlannerItem(ref.watch(plannerRepositoryProvider)),
);

final deletePlannerItemProvider = Provider<DeletePlannerItem>(
  (ref) => DeletePlannerItem(ref.watch(plannerRepositoryProvider)),
);

final reorderPlannerItemsProvider = Provider<ReorderPlannerItems>(
  (ref) => ReorderPlannerItems(ref.watch(plannerRepositoryProvider)),
);

final plannerControllerProvider =
    NotifierProvider<PlannerController, PlannerViewState>(
      PlannerController.new,
    );
