/// Toggles for controlled product extensions (APP-FR-009).
///
/// Public events, polls and event questions are separately controlled and ship
/// behind flags that default to off, so the core product can be released
/// without them (EXT scope).
abstract interface class FeatureFlags {
  bool get publicEventsEnabled;
  bool get pollsEnabled;
  bool get eventQuestionsEnabled;
}

/// Compile-time defaults with every extension disabled. A remote-config backed
/// implementation can replace this without changing call sites.
final class DefaultFeatureFlags implements FeatureFlags {
  const DefaultFeatureFlags();

  @override
  bool get publicEventsEnabled => false;

  @override
  bool get pollsEnabled => false;

  @override
  bool get eventQuestionsEnabled => false;
}
