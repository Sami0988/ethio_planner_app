import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/database_provider.dart';
import '../../data/repositories/recently_deleted_repository_impl.dart';
import '../controllers/recently_deleted_controller.dart';
import 'recently_deleted_view_state.dart';

final recentlyDeletedRepositoryProvider =
    Provider<RecentlyDeletedRepositoryImpl>(
      (ref) => RecentlyDeletedRepositoryImpl(ref.watch(databaseProvider)),
    );

final recentlyDeletedControllerProvider =
    NotifierProvider<RecentlyDeletedController, RecentlyDeletedViewState>(
      RecentlyDeletedController.new,
    );
