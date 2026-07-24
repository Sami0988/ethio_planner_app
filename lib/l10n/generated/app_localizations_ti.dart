// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tigrinya (`ti`).
class AppLocalizationsTi extends AppLocalizations {
  AppLocalizationsTi([String locale = 'ti']) : super(locale);

  @override
  String get appTitle => 'Walia Planner';

  @override
  String get todayTab => 'ልማዓልቲ';

  @override
  String get calendarTab => 'መዓልቲ መቕጻሪ';

  @override
  String get plannerTab => 'ፕላነር';

  @override
  String get moreTab => 'ተወሳኝ';

  @override
  String get searchLabel => 'ፈትን';

  @override
  String get accountLabel => 'መለያ';

  @override
  String get sectionUpNext => 'ዝቕጽል';

  @override
  String get sectionEvents => 'ዝግባረት';

  @override
  String get sectionReminders => 'ኣዝናናር';

  @override
  String get sectionTodaySchedule => 'Today\'s Schedule';

  @override
  String get seeAll => 'ኩሉ ርኣይ';

  @override
  String get quickAddTitle => 'በመዝጊ ወስን';

  @override
  String get quickAddEvent => 'ዝግባረት';

  @override
  String get quickAddReminder => 'ኣዝናናር';

  @override
  String get quickAddNote => 'መዝammer';

  @override
  String get reminderOverdue => 'ዝወ🧿ዳ';

  @override
  String get allDay => 'ምሉእ መዓልቲ';

  @override
  String get ecSuffix => 'EC';

  @override
  String get gcSuffix => 'GC';

  @override
  String get emptyTodayTitle => 'መዓልቲ ጽብቕቲ ከምዚ ኣሓ.datab';

  @override
  String get emptyTodayBody =>
      'ልማዓልቲ ዝኾነ ነገር የለው። ዝግበረት፣ ኣዝናናር ወይ መዝammer ወስን።';

  @override
  String get addSomething => 'ነገር ወስን';

  @override
  String get syncOffline => 'ኣፍሪሃ';

  @override
  String get syncSavedLocally => 'ኣብ ቦታኡ ተቀሚጧል';

  @override
  String get syncWaitingToSync => 'Waiting to sync';

  @override
  String get syncSyncing => 'Syncing…';

  @override
  String get syncingLabel => 'ይሰዓብ ኣለው…';

  @override
  String get syncSynced => 'ተመስርሑ';

  @override
  String get syncFailed => 'ምስራሕ ኣይተሳ㎾ን';

  @override
  String get syncRetry => 'እንደገና ፈትን';

  @override
  String get syncRejected => 'ተቀባይነት ኣልተገበረን';

  @override
  String get syncConflict => 'ግጭት ተገኝቷል';

  @override
  String get syncReview => 'መርምር';

  @override
  String get syncActionRequired => 'ተግባር የድልዋል';

  @override
  String syncWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ለውጦች ለማመሳሰል በመጠባበቅ ላይ',
      one: '1 ለውጥ ለማመሳሰል በመጠባበቅ ላይ',
    );
    return '$_temp0';
  }

  @override
  String get moreReminders => 'ኣዝናናር';

  @override
  String get moreNotes => 'መዝammer';

  @override
  String get morePrint => 'ፕሪንት ስтуዲዮ';

  @override
  String get moreSettings => 'ቅንብሮች';

  @override
  String get moreRecentlyDeleted => 'ናይ ንቃሓ ግዜ';

  @override
  String get settingsTheme => 'እርarence';

  @override
  String get settingsThemeSystem => 'ስርዓት';

  @override
  String get settingsThemeLight => 'ንጹህ';

  @override
  String get settingsThemeDark => 'ጠል锒';

  @override
  String get settingsLanguage => 'ቋንቋ';

  @override
  String get settingsLanguageSystem => 'ስርዓት';

  @override
  String get settingsLanguageEnglish => 'እንግሊዝኛ';

  @override
  String get settingsLanguageAmharic => 'አማርኛ';

  @override
  String get settingsLanguageOromoo => 'ኦሮምኛ';

  @override
  String get settingsLanguageTigrinya => 'ትግርኛ';

  @override
  String get settingsVersion => 'ስርስት';

  @override
  String get authSignIn => 'እቶ';

  @override
  String get authSignUp => 'ተመዝገብ';

  @override
  String get authEmail => 'ኢሜይል';

  @override
  String get authPassword => 'ቃል ምስጢር';

  @override
  String get authConfirmPassword => 'ቃል ምስጢር ኣረጋግጽ';

  @override
  String get authName => 'ስም';

  @override
  String get authForgotPassword => 'ቃል ምስጢር ረሳኽን?';

  @override
  String get authNoAccount => 'መለያ የለዎትም?';

  @override
  String get authHasAccount => 'መለያ አለዎት?';

  @override
  String get authVerifyEmail => 'ኢሜይል ኣረጋግጽ';

  @override
  String get authVerificationCode => 'ቁጽ ምርመራ';

  @override
  String get authResetPassword => 'ቃል ምስጢር ሳን觪';

  @override
  String get authSendCode => 'ቁጽ ስደድ';

  @override
  String get authResetCodeSent => 'ቁጽ ሳን觪 ተሰዲዱ';

  @override
  String get recentlyDeletedTitle => 'ናይ ንቃሓ ግዜ';

  @override
  String get recentlyDeletedEmpty => 'ናይ ንቃሓ ግዜ ነገር የለን';

  @override
  String get recentlyDeletedHint => 'ናይ ንቃሓ ግዜ ነገር ሰዓት 30 እዚህ ይርኣይ';

  @override
  String get recentlyDeletedRestore => 'መልስ';

  @override
  String get recentlyDeletedDelete => 'ሸንጥል';

  @override
  String recentlyDeletedDaysLeft(Object count) {
    return 'ምስጢር እስከ $count መዓልቲ';
  }

  @override
  String get conflictCenterTitle => 'ማዕከል ግጭት';

  @override
  String get conflictCenterEmpty => 'ግጭት የለን';

  @override
  String get conflictCenterSynced => 'ኩሉ መረጠ ተመስርሑ';

  @override
  String get conflictKeepLocal => 'ምንጪ ምዝገባ';

  @override
  String get conflictKeepRemote => 'ርቀት ምዝገባ';

  @override
  String get conflictKeepBoth => 'ክልተን ምዝገባ';

  @override
  String get conflictResolve => 'ፈትን';

  @override
  String get notesTitle => 'መዝammer';

  @override
  String get notesEmpty => 'መዝammer የለን';

  @override
  String get notesHint => 'መዝammer ለመፍጠር + ደምጽ';

  @override
  String get notesPinned => 'ተቀንሲ';

  @override
  String get notesArchived => 'ተቀሚጧል';

  @override
  String get searchEmpty => 'ውጤት ኣልተገኘን';

  @override
  String get searchHint => 'ተፈላጢ ፈትን';

  @override
  String get searchPlaceholder => 'ዝግባረት፣ ኣዝናናር፣ መዝammer ፈትን...';

  @override
  String searchResults(Object count) {
    return 'ውጤት $count';
  }

  @override
  String get plannerFocus => 'ንዑስ';

  @override
  String get plannerPriorities => 'ቀዳሞት';

  @override
  String get plannerChecklist => 'ዝርዝር ምርመራ';

  @override
  String get plannerNotes => 'መዝammer';

  @override
  String get plannerReflection => 'ምutral';

  @override
  String get plannerNoItems => 'ነገር የለን';

  @override
  String get calendarNoEvents => 'ኣብ መዓልቲ ዝግባረት የለን';

  @override
  String get calendarNewEvent => 'ዝግባረት ሓድሽ';

  @override
  String get calendarEditEvent => 'ዝግባረት ኣስተካክል';

  @override
  String get calendarNewReminder => 'ኣዝናናር ሓድሽ';

  @override
  String get calendarEditReminder => 'ኣዝናናር ኣስተካክል';

  @override
  String get calendarTitle => 'ርእስ';

  @override
  String get calendarLocation => 'ቦታ (ኣማራጭ)';

  @override
  String get calendarCategory => 'ምድን (ኣማራጭ)';

  @override
  String get calendarDescription => 'ምብራህ (ኣማራጭ)';

  @override
  String get calendarAllDay => 'ምሉእ መዓልቲ';

  @override
  String get calendarCreate => 'ፍጠር';

  @override
  String get calendarUpdate => 'ኣስተካክል';

  @override
  String get calendarNoEventsForDay => 'No events for this day';

  @override
  String get actionEdit => 'Edit';

  @override
  String get actionDelete => 'Delete';

  @override
  String get actionCancel => 'Cancel';

  @override
  String get deleteEventConfirmTitle => 'Delete Event';

  @override
  String deleteEventConfirmBody(Object title) {
    return 'Are you sure you want to delete \"$title\"?';
  }

  @override
  String get eventSaveError => 'Failed to save event';

  @override
  String get editEventTitle => 'Edit Event';

  @override
  String get newEventTitle => 'New Event';

  @override
  String get fieldTitle => 'Title';

  @override
  String get fieldTitleRequired => 'Title is required';

  @override
  String get fieldLocationOptional => 'Location (optional)';

  @override
  String get fieldCategoryOptional => 'Category (optional)';

  @override
  String get fieldDescriptionOptional => 'Description (optional)';

  @override
  String get categoryNone => 'None';

  @override
  String get categoryWork => 'Work';

  @override
  String get categoryPersonal => 'Personal';

  @override
  String get categoryHoliday => 'Holiday';

  @override
  String get categoryOther => 'Other';

  @override
  String get actionUpdate => 'Update';

  @override
  String get actionCreate => 'Create';

  @override
  String get actionToday => 'Today';

  @override
  String get today => 'Today';

  @override
  String eventsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count events',
      one: '1 event',
    );
    return '$_temp0';
  }

  @override
  String get jumpToDateTitle => 'Jump to Date';

  @override
  String get jumpToDateHint => 'Select a date';

  @override
  String get actionGo => 'Go';

  @override
  String get filterDay => 'Day';

  @override
  String get filterWeek => 'Week';

  @override
  String get filterMonth => 'Month';

  @override
  String get filterAll => 'All';

  @override
  String get calendarAllEvents => 'All Events';
}
