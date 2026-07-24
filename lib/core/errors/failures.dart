/// Base class for all failures in the application.
///
/// Use typed failures to distinguish error categories at the call site
/// without relying on string matching.
abstract class Failure {
  final String message;
  final String? code;

  const Failure({this.message = '', this.code});
}

// ---------------------------------------------------------------------------
// Network / Server
// ---------------------------------------------------------------------------

class ServerFailure extends Failure {
  final int? statusCode;

  const ServerFailure({
    super.message = 'Server error occurred',
    this.statusCode,
    super.code = 'server_error',
  });
}

class NetworkFailure extends Failure {
  const NetworkFailure({
    super.message = 'No internet connection',
    super.code = 'network_error',
  });
}

class TimeoutFailure extends Failure {
  const TimeoutFailure({
    super.message = 'Request timed out',
    super.code = 'timeout',
  });
}

// ---------------------------------------------------------------------------
// Cache / Database
// ---------------------------------------------------------------------------

class CacheFailure extends Failure {
  const CacheFailure({
    super.message = 'Cache error occurred',
    super.code = 'cache_error',
  });
}

class DatabaseFailure extends Failure {
  const DatabaseFailure({
    super.message = 'Database error occurred',
    super.code = 'database_error',
  });
}

// ---------------------------------------------------------------------------
// Auth
// ---------------------------------------------------------------------------

class AuthFailure extends Failure {
  const AuthFailure({
    super.message = 'Authentication error',
    super.code = 'auth_error',
  });
}

class InvalidCredentialsFailure extends AuthFailure {
  const InvalidCredentialsFailure({
    super.message = 'Invalid email or password',
    super.code = 'invalid_credentials',
  });
}

class UserNotFoundFailure extends AuthFailure {
  const UserNotFoundFailure({
    super.message = 'User not found',
    super.code = 'user_not_found',
  });
}

class EmailAlreadyInUseFailure extends AuthFailure {
  const EmailAlreadyInUseFailure({
    super.message = 'Email is already in use',
    super.code = 'email_in_use',
  });
}

// ---------------------------------------------------------------------------
// Sync
// ---------------------------------------------------------------------------

class SyncFailure extends Failure {
  const SyncFailure({
    super.message = 'Sync error occurred',
    super.code = 'sync_error',
  });
}

class SyncConflictFailure extends SyncFailure {
  final String entityType;
  final String entityId;

  const SyncConflictFailure({
    required this.entityType,
    required this.entityId,
    super.message = 'Sync conflict detected',
    super.code = 'sync_conflict',
  });
}

// ---------------------------------------------------------------------------
// Validation
// ---------------------------------------------------------------------------

class ValidationFailure extends Failure {
  const ValidationFailure({
    super.message = 'Validation error',
    super.code = 'validation_error',
  });
}

class NotFoundFailure extends Failure {
  const NotFoundFailure({
    super.message = 'Resource not found',
    super.code = 'not_found',
  });
}
