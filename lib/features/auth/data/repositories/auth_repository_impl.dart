import 'package:dio/dio.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _remoteDatasource;

  AuthRepositoryImpl(this._remoteDatasource);

  @override
  Future<AuthResult> register({
    required String email,
    required String password,
    String? displayName,
  }) async {
    try {
      final data = await _remoteDatasource.register(
        email: email,
        password: password,
        displayName: displayName,
      );
      return AuthResult(
        success: true,
        accessToken: data['access_token'] as String?,
        refreshToken: data['refresh_token'] as String?,
        user: data['user'] != null
            ? UserModel.fromJson(
                data['user'] as Map<String, dynamic>,
              ).toEntity()
            : null,
      );
    } on DioException catch (e) {
      return AuthResult(success: false, error: _errorMessage(e));
    }
  }

  @override
  Future<AuthResult> verifyEmail({
    required String email,
    required String code,
  }) async {
    try {
      final data = await _remoteDatasource.verifyEmail(
        email: email,
        code: code,
      );
      return AuthResult(
        success: true,
        accessToken: data['access_token'] as String?,
        refreshToken: data['refresh_token'] as String?,
        user: data['user'] != null
            ? UserModel.fromJson(
                data['user'] as Map<String, dynamic>,
              ).toEntity()
            : null,
      );
    } on DioException catch (e) {
      return AuthResult(success: false, error: _errorMessage(e));
    }
  }

  @override
  Future<AuthResult> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final data = await _remoteDatasource.signIn(
        email: email,
        password: password,
      );
      return AuthResult(
        success: true,
        accessToken: data['access_token'] as String?,
        refreshToken: data['refresh_token'] as String?,
        user: data['user'] != null
            ? UserModel.fromJson(
                data['user'] as Map<String, dynamic>,
              ).toEntity()
            : null,
      );
    } on DioException catch (e) {
      return AuthResult(success: false, error: _errorMessage(e));
    }
  }

  @override
  Future<AuthResult> resetPassword({required String email}) async {
    try {
      await _remoteDatasource.resetPassword(email: email);
      return const AuthResult(success: true);
    } on DioException catch (e) {
      return AuthResult(success: false, error: _errorMessage(e));
    }
  }

  @override
  Future<AuthResult> confirmPasswordReset({
    required String email,
    required String code,
    required String newPassword,
  }) async {
    try {
      await _remoteDatasource.confirmPasswordReset(
        email: email,
        code: code,
        newPassword: newPassword,
      );
      return const AuthResult(success: true);
    } on DioException catch (e) {
      return AuthResult(success: false, error: _errorMessage(e));
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _remoteDatasource.signOut();
    } on DioException {
      // Ignore sign-out errors
    }
  }

  @override
  Future<User?> getCurrentUser() async {
    try {
      final data = await _remoteDatasource.getCurrentUser();
      return UserModel.fromJson(data).toEntity();
    } on DioException {
      return null;
    }
  }

  String _errorMessage(DioException e) {
    if (e.response?.data is Map<String, dynamic>) {
      final data = e.response?.data as Map<String, dynamic>;
      return data['message'] as String? ?? 'An error occurred';
    }
    if (e.message != null) {
      return e.message!;
    }
    return 'An unexpected error occurred';
  }
}
