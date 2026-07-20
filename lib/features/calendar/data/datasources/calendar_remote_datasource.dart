import '../models/calendar_event_model.dart';

class CalendarRemoteDatasource {
  Future<List<CalendarEventModel>> getEvents(DateTime month) async {
    throw UnimplementedError('Implement remote fetch');
  }
}
