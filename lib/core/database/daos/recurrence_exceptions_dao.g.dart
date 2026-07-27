// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recurrence_exceptions_dao.dart';

// ignore_for_file: type=lint
mixin _$RecurrenceExceptionsDaoMixin on DatabaseAccessor<AppDatabase> {
  $RecurrenceExceptionsTable get recurrenceExceptions =>
      attachedDatabase.recurrenceExceptions;
  RecurrenceExceptionsDaoManager get managers =>
      RecurrenceExceptionsDaoManager(this);
}

class RecurrenceExceptionsDaoManager {
  final _$RecurrenceExceptionsDaoMixin _db;
  RecurrenceExceptionsDaoManager(this._db);
  $$RecurrenceExceptionsTableTableManager get recurrenceExceptions =>
      $$RecurrenceExceptionsTableTableManager(
        _db.attachedDatabase,
        _db.recurrenceExceptions,
      );
}
