import 'package:drift/drift.dart';

// ---------------------------------------------------------------------------
// Business tables — sync-metadata columns defined directly on each table
// so that Drift's Migrator.addColumn works in migrations.
// ---------------------------------------------------------------------------

class CalendarEvents extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  DateTimeColumn get ecDate => dateTime()();
  DateTimeColumn get gcDate => dateTime()();
  TextColumn get description => text().nullable()();
  BoolColumn get isAllDay => boolean().withDefault(const Constant(false))();
  TextColumn get category => text().nullable()();
  TextColumn get location => text().nullable()();
  TextColumn get recurrenceRule => text().nullable()();
  // Sprint 1: Sync metadata
  TextColumn get accountId => text().nullable()();
  IntColumn get serverVersion => integer().withDefault(const Constant(0))();
  TextColumn get syncStatus => text().withDefault(const Constant('local'))();
  TextColumn get lastOperationId => text().nullable()();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class PlannerItems extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  DateTimeColumn get ecDate => dateTime()();
  DateTimeColumn get gcDate => dateTime()();
  TextColumn get description => text().nullable()();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
  TextColumn get section => text().withDefault(const Constant('focus'))();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
  TextColumn get linkedEventId => text().nullable()();
  TextColumn get linkedReminderId => text().nullable()();
  // Sprint 1: Sync metadata
  TextColumn get accountId => text().nullable()();
  IntColumn get serverVersion => integer().withDefault(const Constant(0))();
  TextColumn get syncStatus => text().withDefault(const Constant('local'))();
  TextColumn get lastOperationId => text().nullable()();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class Reminders extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  DateTimeColumn get ecDate => dateTime()();
  DateTimeColumn get gcDate => dateTime()();
  TextColumn get description => text().nullable()();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
  IntColumn get notificationId => integer().nullable()();
  TextColumn get category => text().nullable()();
  TextColumn get linkedEventId => text().nullable()();
  TextColumn get recurrenceRule => text().nullable()();
  // Sprint 1: Sync metadata
  TextColumn get accountId => text().nullable()();
  IntColumn get serverVersion => integer().withDefault(const Constant(0))();
  TextColumn get syncStatus => text().withDefault(const Constant('local'))();
  TextColumn get lastOperationId => text().nullable()();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class Notes extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get content => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get isPinned => boolean().withDefault(const Constant(false))();
  BoolColumn get isArchived => boolean().withDefault(const Constant(false))();
  TextColumn get category => text().nullable()();
  TextColumn get linkedEventId => text().nullable()();
  TextColumn get linkedReminderId => text().nullable()();
  TextColumn get linkedPlannerItemId => text().nullable()();
  // Sprint 1: Sync metadata
  TextColumn get accountId => text().nullable()();
  IntColumn get serverVersion => integer().withDefault(const Constant(0))();
  TextColumn get syncStatus => text().withDefault(const Constant('local'))();
  TextColumn get lastOperationId => text().nullable()();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// ---------------------------------------------------------------------------
// Recurrence exceptions table (Sprint 5 / CAL-FR recurrence exceptions)
// ---------------------------------------------------------------------------

/// Tracks individual occurrence exceptions for recurring events and reminders.
///
/// Each row represents one skipped or modified occurrence. The [exceptionKey]
/// format is `{entityId}_{occurrenceTimestamp}` which uniquely identifies
/// a single occurrence within a recurrence series.
class RecurrenceExceptions extends Table {
  /// Unique exception ID (UUID).
  TextColumn get id => text()();

  /// The entity type: 'event' or 'reminder'.
  TextColumn get entityType => text()();

  /// The entity ID of the recurring event/reminder.
  TextColumn get entityId => text()();

  /// Composite key: `{entityId}_{occurrenceTimestamp}` for fast lookup.
  TextColumn get exceptionKey => text()();

  /// Exception type: 'skipped' or 'modified'.
  TextColumn get exceptionType => text()();

  /// For 'modified' exceptions: the new GC date for this occurrence.
  /// Null for 'skipped' exceptions.
  DateTimeColumn get modifiedGcDate => dateTime().nullable()();

  /// For 'modified' exceptions: the new EC date for this occurrence.
  DateTimeColumn get modifiedEcDate => dateTime().nullable()();

  /// When this exception was created.
  DateTimeColumn get createdAt => dateTime()();

  /// Sync metadata.
  TextColumn get accountId => text().nullable()();
  IntColumn get serverVersion => integer().withDefault(const Constant(0))();
  TextColumn get syncStatus => text().withDefault(const Constant('local'))();
  TextColumn get lastOperationId => text().nullable()();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Set<Column>> get uniqueKeys => [
    {exceptionKey},
  ];
}

// ---------------------------------------------------------------------------
// Non-business tables (no sync metadata needed)
// ---------------------------------------------------------------------------

class NoteRevisions extends Table {
  TextColumn get id => text()();
  TextColumn get noteId => text()();
  TextColumn get title => text()();
  TextColumn get content => text().nullable()();
  TextColumn get category => text().nullable()();
  IntColumn get revisionNumber => integer()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class RecentlyDeletedItems extends Table {
  TextColumn get id => text()();
  TextColumn get entityType => text()();
  TextColumn get entityId => text()();
  TextColumn get entityTitle => text()();
  DateTimeColumn get deletedAt => dateTime()();
  TextColumn get entityData => text()();

  @override
  Set<Column> get primaryKey => {id};
}

// ---------------------------------------------------------------------------
// Outbox operations table (Sprint 1 / BR-OFF-001)
// ---------------------------------------------------------------------------

/// Represents a pending offline write that must be synchronized.
///
/// Every supported offline write persists the business record AND an outbox
/// operation in ONE Drift transaction (BR-OFF-001). The operation ID is the
/// idempotency key (BR-SYNC-001).
class OutboxOperations extends Table {
  /// Unique operation ID — the idempotency key (UUID).
  TextColumn get id => text()();

  /// The entity type this operation targets (e.g. 'event', 'reminder').
  TextColumn get entityType => text()();

  /// The entity ID affected by this operation.
  TextColumn get entityId => text()();

  /// The operation type: 'create', 'update', 'delete'.
  TextColumn get operationType => text()();

  /// JSON-serialized payload for create/update operations.
  TextColumn get payload => text().nullable()();

  /// When this operation was created locally.
  DateTimeColumn get createdAt => dateTime()();

  /// Number of times this operation has been retried.
  IntColumn get retryCount => integer().withDefault(const Constant(0))();

  /// Last error message if the operation failed.
  TextColumn get lastError => text().nullable()();

  /// When the last attempt was made.
  DateTimeColumn get lastAttemptAt => dateTime().nullable()();

  /// The owning account ID.
  TextColumn get accountId => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
