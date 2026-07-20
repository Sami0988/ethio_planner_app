import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/calendar_event.dart';
import '../../domain/repositories/calendar_repository.dart';
import '../datasources/calendar_remote_datasource.dart';
import '../datasources/calendar_local_datasource.dart';

class CalendarRepositoryImpl implements CalendarRepository {
  final CalendarRemoteDatasource remoteDatasource;
  final CalendarLocalDatasource localDatasource;

  CalendarRepositoryImpl({
    required this.remoteDatasource,
    required this.localDatasource,
  });

  @override
  Future<Either<Failure, List<CalendarEvent>>> getEvents(DateTime month) async {
    throw UnimplementedError('Implement getEvents');
  }
}
