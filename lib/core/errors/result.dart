import 'failures.dart';

/// A wrapper for values that can be either a [Failure] or a success value [T].
///
/// Use this instead of throwing exceptions to make error handling explicit
/// and type-safe at the call site.
sealed class Result<T> {
  const Result();

  /// Create a success result.
  const factory Result.success(T value) = Success<T>;

  /// Create a failure result.
  const factory Result.failure(Failure failure) = FailureResult<T>;

  /// Whether this is a success result.
  bool get isSuccess => this is Success<T>;

  /// Whether this is a failure result.
  bool get isFailure => this is FailureResult<T>;

  /// Get the success value or null.
  T? get value => switch (this) {
    Success<T>(:final value) => value,
    FailureResult<T>() => null,
  };

  /// Get the failure or null.
  Failure? get failure => switch (this) {
    Success<T>() => null,
    FailureResult<T>(:final failure) => failure,
  };

  /// Transform the success value.
  Result<R> map<R>(R Function(T value) transform) => switch (this) {
    Success<T>(:final value) => Result.success(transform(value)),
    FailureResult<T>(:final failure) => Result.failure(failure),
  };

  /// Transform the failure.
  Result<T> mapFailure(Failure Function(Failure failure) transform) =>
      switch (this) {
        Success<T>() => this,
        FailureResult<T>(:final failure) => Result.failure(transform(failure)),
      };

  /// Get the success value or throw the failure.
  T getOrThrow() => switch (this) {
    Success<T>(:final value) => value,
    FailureResult<T>(:final failure) => throw failure,
  };

  /// Get the success value or return a default.
  T orElse(T defaultValue) => switch (this) {
    Success<T>(:final value) => value,
    FailureResult<T>() => defaultValue,
  };

  /// Get the success value or compute it from the failure.
  T orElseCompute(T Function(Failure failure) compute) => switch (this) {
    Success<T>(:final value) => value,
    FailureResult<T>(:final failure) => compute(failure),
  };

  /// Pattern match on success/failure.
  R fold<R>(
    R Function(T value) onSuccess,
    R Function(Failure failure) onFailure,
  ) => switch (this) {
    Success<T>(:final value) => onSuccess(value),
    FailureResult<T>(:final failure) => onFailure(failure),
  };
}

class Success<T> extends Result<T> {
  @override
  final T value;

  const Success(this.value);

  @override
  String toString() => 'Success($value)';
}

class FailureResult<T> extends Result<T> {
  @override
  final Failure failure;

  const FailureResult(this.failure);

  @override
  String toString() => 'Failure(${failure.message})';
}
