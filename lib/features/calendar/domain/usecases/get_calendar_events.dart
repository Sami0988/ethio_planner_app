import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/calendar_event.dart';
import '../repositories/calendar_repository.dart';

class GetCalendarEvents {
  final CalendarRepository _repository;

  GetCalendarEvents(this._repository);

  Future<Either<Failure, List<CalendarEvent>>> call(DateTime month) async {
    return _repository.getEvents(month);
  }
}
