/// The calendar system a record was authored in.
///
/// Per business rule BR-CAL-001, the original basis governs the stored meaning
/// of a record (especially recurrence) and must never be silently rewritten to
/// the other system.
enum CalendarBasis { ethiopian, gregorian }
