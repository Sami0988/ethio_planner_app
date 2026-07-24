import 'package:dio/dio.dart';

class SyncRemoteDatasource {
  final Dio _dio;

  SyncRemoteDatasource(this._dio);

  Future<Map<String, dynamic>> importGuestData(
    Map<String, dynamic> guestData,
  ) async {
    final response = await _dio.post<Response<dynamic>>(
      '/sync/import-guest',
      data: guestData,
    );
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> getChanges(String lastSyncAt) async {
    final response = await _dio.get<Response<dynamic>>(
      '/sync/changes',
      queryParameters: {'last_sync_at': lastSyncAt},
    );
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> pushChanges(
    List<Map<String, dynamic>> changes,
  ) async {
    final response = await _dio.post<Response<dynamic>>(
      '/sync/push',
      data: {'changes': changes},
    );
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> fullResync(Map<String, dynamic> allData) async {
    final response = await _dio.post<Response<dynamic>>(
      '/sync/full-resync',
      data: allData,
    );
    return response.data as Map<String, dynamic>;
  }
}
