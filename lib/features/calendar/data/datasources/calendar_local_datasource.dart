import '../models/calendar_event_model.dart';

class CalendarLocalDatasource {
  Future<List<CalendarEventModel>> getCachedEvents() async {
    throw UnimplementedError('Implement local cache');
  }

  Future<void> cacheEvents(List<CalendarEventModel> events) async {
    throw UnimplementedError('Implement cache write');
  }
}
