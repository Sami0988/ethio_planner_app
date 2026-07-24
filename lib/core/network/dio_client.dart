import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../constants/app_constants.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/refresh_interceptor.dart';

class DioClient {
  late final Dio _dio;

  DioClient({FlutterSecureStorage? storage}) {
    final secureStorage = storage ?? const FlutterSecureStorage();

    _dio = Dio(
      BaseOptions(
        baseUrl: const String.fromEnvironment(
          'API_BASE_URL',
          defaultValue: AppConstants.baseUrl,
        ),
        connectTimeout: AppConstants.networkTimeout,
        receiveTimeout: AppConstants.networkTimeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _dio.interceptors.addAll([
      AuthInterceptor(secureStorage),
      RefreshInterceptor(secureStorage, _dio),
      if (const bool.fromEnvironment('dart.vm.product') == false)
        LogInterceptor(),
    ]);
  }

  Dio get dio => _dio;
}
