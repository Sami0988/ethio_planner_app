import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/database_provider.dart';
import 'soft_delete_service.dart';

final softDeleteServiceProvider = Provider<SoftDeleteService>((ref) {
  return SoftDeleteService(ref.watch(databaseProvider));
});
