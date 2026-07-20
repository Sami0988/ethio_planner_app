class Reminder {
  final String id;
  final String title;
  final DateTime date;
  final String? description;

  const Reminder({
    required this.id,
    required this.title,
    required this.date,
    this.description,
  });
}
