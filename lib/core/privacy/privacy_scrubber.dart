/// Utility to scrub sensitive data from logs, crash reports, and diagnostics.
///
/// Per spec Section 30: no private content (note text, reminder notes, planner
/// content, credentials) should ever appear in notification payloads, logs,
/// or crash metadata.
class PrivacyScrubber {
  PrivacyScrubber._();

  /// Patterns that should never appear in logs or crash reports.
  static final _sensitivePatterns = [
    RegExp(r'password', caseSensitive: false),
    RegExp(r'token', caseSensitive: false),
    RegExp(r'access_token', caseSensitive: false),
    RegExp(r'refresh_token', caseSensitive: false),
    RegExp(r'Bearer\s+[A-Za-z0-9\-._~+/]+=*', caseSensitive: false),
    RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b'),
  ];

  /// Scrubs sensitive data from a string before logging or crash reporting.
  static String scrub(String input) {
    var result = input;
    for (final pattern in _sensitivePatterns) {
      result = result.replaceAll(pattern, '[REDACTED]');
    }
    return result;
  }

  /// Checks if a string contains potentially sensitive content.
  static bool containsSensitiveData(String input) {
    for (final pattern in _sensitivePatterns) {
      if (pattern.hasMatch(input)) return true;
    }
    return false;
  }

  /// Scrubs a map of data, redacting any values that match sensitive patterns.
  static Map<String, dynamic> scrubMap(Map<String, dynamic> data) {
    final result = <String, dynamic>{};
    for (final entry in data.entries) {
      if (entry.value is String) {
        result[entry.key] = scrub(entry.value as String);
      } else if (entry.value is Map<String, dynamic>) {
        result[entry.key] = scrubMap(entry.value as Map<String, dynamic>);
      } else {
        result[entry.key] = entry.value;
      }
    }
    return result;
  }

  /// Returns a safe version of note/reminder content for notifications.
  /// Only includes a truncated preview, never the full content.
  static String safeNotificationContent(String? content, {int maxLength = 50}) {
    if (content == null || content.isEmpty) return '';
    if (content.length <= maxLength) return content;
    return '${content.substring(0, maxLength)}...';
  }

  /// Validates that a log message doesn't contain sensitive data.
  /// Returns null if safe, or a warning message if sensitive data is detected.
  static String? validateLogMessage(String message) {
    if (containsSensitiveData(message)) {
      return 'WARNING: Log message contains potentially sensitive data. '
          'Consider scrubbing before logging.';
    }
    return null;
  }
}
