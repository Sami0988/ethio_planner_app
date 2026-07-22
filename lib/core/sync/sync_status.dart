/// The user-visible synchronization state of a record (SYNC-FR-004).
///
/// This state is persisted with each synchronized record and surfaced in the
/// UI. It must never be inferred as [synced] merely because a network
/// connection exists (SYNC-FR-005 / BR-OFF-002).
enum SyncStatus {
  offline,
  savedLocally,
  waitingToSync,
  syncing,
  synced,
  syncFailed,
  rejected,
  conflictDetected,
  actionRequired,
}
