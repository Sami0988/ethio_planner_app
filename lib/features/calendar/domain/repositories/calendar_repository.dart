import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/calendar_event.dart';

abstract class CalendarRepository {
  Future<Either<Failure, List<CalendarEvent>>> getEvents(DateTime month);
}
