class CalendarEvent {
  final String id;
  final String title;
  final DateTime date;
  final String? description;

  const CalendarEvent({
    required this.id,
    required this.title,
    required this.date,
    this.description,
  });
}
