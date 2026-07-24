import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/database_provider.dart';
import '../../../../core/providers/dio_provider.dart';
import '../../data/datasources/sync_remote_datasource.dart';
import '../../data/repositories/sync_repository_impl.dart';
import '../controllers/sync_controller.dart';
import 'sync_view_state.dart';

final syncRemoteDatasourceProvider = Provider<SyncRemoteDatasource>(
  (ref) => SyncRemoteDatasource(ref.watch(dioProvider)),
);

final syncRepositoryProvider = Provider<SyncRepositoryImpl>(
  (ref) => SyncRepositoryImpl(
    ref.watch(databaseProvider),
    ref.watch(syncRemoteDatasourceProvider),
  ),
);

final syncControllerProvider =
    NotifierProvider<SyncController, SyncViewState>(
  SyncController.new,
);
