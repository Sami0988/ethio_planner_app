/// Boundary for privacy-safe technical monitoring (SRS §54).
///
/// Implementations MUST NOT capture private content — note or planner text,
/// reminder or event descriptions, unpublished questions, voter identity,
/// access or refresh tokens, passwords, or payment credentials
/// (BR-PRIV-001 / PRIV-FR-010). Only non-sensitive technical signals.
abstract interface class MonitoringService {
  void recordEvent(String name, {Map<String, Object?> properties});

  void recordError(
    Object error,
    StackTrace stackTrace, {
    bool fatal,
    String? correlationId,
  });
}

/// Default no-op implementation used until an approved adapter (e.g. Sentry)
/// is wired in behind this same interface.
final class NoopMonitoringService implements MonitoringService {
  const NoopMonitoringService();

  @override
  void recordEvent(String name, {Map<String, Object?> properties = const {}}) {}

  @override
  void recordError(
    Object error,
    StackTrace stackTrace, {
    bool fatal = false,
    String? correlationId,
  }) {}
}
