import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/conflict_repository_impl.dart';
import '../controllers/conflict_controller.dart';
import 'conflict_view_state.dart';

final conflictRepositoryProvider = Provider<ConflictRepositoryImpl>(
  (ref) => ConflictRepositoryImpl(),
);

final conflictControllerProvider =
    NotifierProvider<ConflictController, ConflictViewState>(
  ConflictController.new,
);
