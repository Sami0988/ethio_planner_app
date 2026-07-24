import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/database_provider.dart';
import '../../data/repositories/search_repository_impl.dart';
import '../controllers/search_controller.dart';
import 'search_view_state.dart';

final searchRepositoryProvider = Provider<SearchRepositoryImpl>(
  (ref) => SearchRepositoryImpl(ref.watch(databaseProvider)),
);

final searchControllerProvider =
    NotifierProvider<SearchController, SearchViewState>(SearchController.new);
