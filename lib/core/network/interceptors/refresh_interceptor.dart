import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class RefreshInterceptor extends Interceptor {
  final FlutterSecureStorage _storage;
  final Dio _dio;
  bool _isRefreshing = false;

  RefreshInterceptor(this._storage, this._dio);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 && !_isRefreshing) {
      _isRefreshing = true;
      try {
        final refreshToken = await _storage.read(key: 'refresh_token');
        if (refreshToken == null) {
          await _clearTokens();
          handler.next(err);
          return;
        }

        final response = await _dio.post<Response<dynamic>>(
          '/auth/refresh',
          data: {'refresh_token': refreshToken},
        );

        if (response.statusCode == 200) {
          final data = response.data as Map<String, dynamic>?;
          if (data != null) {
            await _storage.write(
              key: 'access_token',
              value: data['access_token'] as String,
            );
            await _storage.write(
              key: 'refresh_token',
              value: data['refresh_token'] as String,
            );

            err.requestOptions.headers['Authorization'] =
                'Bearer ${data['access_token']}';
          }
          final retryResponse = await _dio.fetch<Response<dynamic>>(
            err.requestOptions,
          );
          handler.resolve(retryResponse);
        } else {
          await _clearTokens();
          handler.next(err);
        }
      } catch (e) {
        await _clearTokens();
        handler.next(err);
      } finally {
        _isRefreshing = false;
      }
    } else {
      handler.next(err);
    }
  }

  Future<void> _clearTokens() async {
    await _storage.delete(key: 'access_token');
    await _storage.delete(key: 'refresh_token');
  }
}
