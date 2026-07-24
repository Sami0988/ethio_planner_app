// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Amharic (`am`).
class AppLocalizationsAm extends AppLocalizations {
  AppLocalizationsAm([String locale = 'am']) : super(locale);

  @override
  String get appTitle => 'ዋሊያ ፕላነር';

  @override
  String get todayTab => 'ዛሬ';

  @override
  String get calendarTab => 'ቀን መቁጠሪያ';

  @override
  String get plannerTab => 'ፕላነር';

  @override
  String get moreTab => 'ተጨማሪ';

  @override
  String get searchLabel => 'ፈልግ';

  @override
  String get accountLabel => 'መለያ';

  @override
  String get sectionUpNext => 'ቀጣይ';

  @override
  String get sectionEvents => 'ዝግጅቶች';

  @override
  String get sectionReminders => 'አስታዋሾች';

  @override
  String get sectionTodaySchedule => 'የዛሬ መርሆ';

  @override
  String get seeAll => 'ሁሉንም ይመልከቱ';

  @override
  String get quickAddTitle => 'በፍጥነት ጨምር';

  @override
  String get quickAddEvent => 'ዝግጅት';

  @override
  String get quickAddReminder => 'አስታዋሽ';

  @override
  String get quickAddNote => 'ማስታወሻ';

  @override
  String get reminderOverdue => 'አልፎበታል';

  @override
  String get allDay => 'ሙሉ ቀን';

  @override
  String get ecSuffix => 'ዓ.ም.';

  @override
  String get gcSuffix => 'እ.ኤ.አ.';

  @override
  String get emptyTodayTitle => 'የተረጋጋ አዲስ ቀን';

  @override
  String get emptyTodayBody =>
      'ዛሬ የተያዘ ነገር የለም። ዝግጁ ሲሆኑ ዝግጅት፣ አስታዋሽ ወይም ማስታወሻ ይጨምሩ።';

  @override
  String get addSomething => 'አንድ ነገር ይጨምሩ';

  @override
  String get syncOffline => 'ከመስመር ውጭ';

  @override
  String get syncSavedLocally => 'በአካባቢው ተቀምጧል';

  @override
  String get syncWaitingToSync => '�ማመሳሰል በመጠባበቅ ላይ';

  @override
  String get syncSyncing => 'በማመሳሰል ላይ…';

  @override
  String get syncingLabel => 'በማመሳሰል ላይ…';

  @override
  String get syncSynced => 'ተመሳስሏል';

  @override
  String get syncFailed => 'ማመሳሰል አልተሳካም';

  @override
  String get syncRetry => 'እንደገና ሞክር';

  @override
  String get syncRejected => 'ተቀባይነት አላገኘም';

  @override
  String get syncConflict => 'ግጭት ተገኝቷል';

  @override
  String get syncReview => 'ገምግም';

  @override
  String get syncActionRequired => 'እርምጃ ያስፈልጋል';

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
  String get moreReminders => 'አስታዋሾች';

  @override
  String get moreNotes => 'ማስታወሻዎች';

  @override
  String get morePrint => 'ማተሚያ ስቱዲዮ';

  @override
  String get moreSettings => 'ቅንብሮች';

  @override
  String get moreRecentlyDeleted => 'በቅርብ ጊዜ የተጻፉ';

  @override
  String get settingsTheme => 'ምድን';

  @override
  String get settingsThemeSystem => 'ስርዓት';

  @override
  String get settingsThemeLight => 'ብርሃን';

  @override
  String get settingsThemeDark => 'ጥላ';

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
  String get authSignIn => 'ይግቡ';

  @override
  String get authSignUp => 'ይመዝገቡ';

  @override
  String get authEmail => 'ኢሜይል';

  @override
  String get authPassword => 'የይለፍ ቃል';

  @override
  String get authConfirmPassword => 'የይለፍ ቃል ያረጋግጡ';

  @override
  String get authName => 'ስም';

  @override
  String get authForgotPassword => 'የይለፍ ቃል ረሳኽን?';

  @override
  String get authNoAccount => 'መለያ የለዎትም?';

  @override
  String get authHasAccount => 'መለያ አለዎት?';

  @override
  String get authVerifyEmail => 'ኢሜይል ያረጋግጡ';

  @override
  String get authVerificationCode => 'የማረጋገጫ ቁጥር';

  @override
  String get authResetPassword => 'የይለፍ ቃል ያደስሱ';

  @override
  String get authSendCode => 'ሃረግ ይላኩ';

  @override
  String get authResetCodeSent => 'የማደስ ሃረግ ተልኳል';

  @override
  String get recentlyDeletedTitle => 'በቅርብ ጊዜ የተጻፉ';

  @override
  String get recentlyDeletedEmpty => 'በቅርብ ጊዜ የተጻፉ ነገሮች የለም';

  @override
  String get recentlyDeletedHint => 'የተጻፉ ነገሮች ለ30 ቀን እዚህ ይታያሉ';

  @override
  String get recentlyDeletedRestore => 'ያድሱ';

  @override
  String get recentlyDeletedDelete => 'ጠፍን';

  @override
  String recentlyDeletedDaysLeft(Object count) {
    return 'ማጥፋት እስከ $count ቀን';
  }

  @override
  String get conflictCenterTitle => 'የግጭት ማዕከል';

  @override
  String get conflictCenterEmpty => 'ግጭት የለም';

  @override
  String get conflictCenterSynced => 'ሁሉም መረጃዎች ተመሳስለዋል';

  @override
  String get conflictKeepLocal => 'የአካባቢ መረጃ ያድርሱ';

  @override
  String get conflictKeepRemote => 'የርቀት መረጃ ያድርሱ';

  @override
  String get conflictKeepBoth => 'ሁለቱንም ያድርሱ';

  @override
  String get conflictResolve => 'ያስተናግዱ';

  @override
  String get notesTitle => 'ማስታወሻዎች';

  @override
  String get notesEmpty => 'ማስታወሻዎች የለም';

  @override
  String get notesHint => 'ማስታወሻ ለመፍጠር + ይጫኑ';

  @override
  String get notesPinned => 'የተቆለፈ';

  @override
  String get notesArchived => 'የተቀመጠ';

  @override
  String get searchEmpty => 'ውጤት አልተገኘም';

  @override
  String get searchHint => 'የተለየ ፍላጎት ይሞክሩ';

  @override
  String get searchPlaceholder => 'ዝግጅቶች፣ አስታዋሾች፣ ማስታወሻዎች ይፈልጉ...';

  @override
  String searchResults(Object count) {
    return 'ውጤቶች $count';
  }

  @override
  String get plannerFocus => 'ማማከል';

  @override
  String get plannerPriorities => 'ቅድመ ጉዳዮች';

  @override
  String get plannerChecklist => 'የማረጋገጫ ዝርዝር';

  @override
  String get plannerNotes => 'ማስታወሻዎች';

  @override
  String get plannerReflection => 'ማ反思';

  @override
  String get plannerNoItems => 'ነገሮች የለም';

  @override
  String get calendarNoEvents => 'ለዚህ ቀን ዝግጅት የለም';

  @override
  String get calendarNewEvent => 'አዲስ ዝግጅት';

  @override
  String get calendarEditEvent => 'ዝግጅት ያስተካክሉ';

  @override
  String get calendarNewReminder => 'አዲስ አስታዋሽ';

  @override
  String get calendarEditReminder => 'አስታዋሽ ያስተካክሉ';

  @override
  String get calendarTitle => 'ርዕስ';

  @override
  String get calendarLocation => 'አድራሻ (አማራጭ)';

  @override
  String get calendarCategory => 'ምድን (አማራጭ)';

  @override
  String get calendarDescription => 'ማብራሪያ (አማራጭ)';

  @override
  String get calendarAllDay => 'ሙሉ ቀን';

  @override
  String get calendarCreate => 'ፍጠር';

  @override
  String get calendarUpdate => 'ማዘመን';

  @override
  String get calendarNoEventsForDay => 'ለዚህ ቀን ዝግጅት የለም';

  @override
  String get actionEdit => 'ያስተካክሉ';

  @override
  String get actionDelete => 'ጠፍን';

  @override
  String get actionCancel => 'ሰርዝ';

  @override
  String get deleteEventConfirmTitle => 'ዝግጅት ሰርዝ';

  @override
  String deleteEventConfirmBody(Object title) {
    return ' \"$title\" ለመስረቅ እርግጠኛ ነዎት?';
  }

  @override
  String get eventSaveError => 'ዝግጅት ማስቀመጥ አልተሳካም';

  @override
  String get editEventTitle => 'ዝግጅት ያስተካክሉ';

  @override
  String get newEventTitle => 'አዲስ ዝግጅት';

  @override
  String get fieldTitle => 'ርዕስ';

  @override
  String get fieldTitleRequired => 'ርዕስ ያስፈልጋል';

  @override
  String get fieldLocationOptional => 'አድራሻ (አማራጭ)';

  @override
  String get fieldCategoryOptional => 'ምድን (አማራጭ)';

  @override
  String get fieldDescriptionOptional => 'ማብራሪያ (አማራጭ)';

  @override
  String get categoryNone => 'የለም';

  @override
  String get categoryWork => 'ስራ';

  @override
  String get categoryPersonal => 'የግል';

  @override
  String get categoryHoliday => 'በዓል';

  @override
  String get categoryOther => 'ተጨማሪ';

  @override
  String get actionUpdate => 'ማዘመን';

  @override
  String get actionCreate => 'ፍጠር';

  @override
  String get actionToday => 'ዛሬ';

  @override
  String get today => 'ዛሬ';

  @override
  String eventsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ዝግጅቶች',
      one: '1 ዝግጅት',
    );
    return '$_temp0';
  }

  @override
  String get jumpToDateTitle => 'ወደ ቀን ሂድ';

  @override
  String get jumpToDateHint => 'ቀን ይምረጡ';

  @override
  String get actionGo => 'ሂድ';

  @override
  String get filterDay => 'ቀን';

  @override
  String get filterWeek => 'ሳምንት';

  @override
  String get filterMonth => 'ወር';

  @override
  String get filterAll => 'ሁሉም';

  @override
  String get calendarAllEvents => 'ሁሉም ዝግጅቶች';

  @override
  String get settingsCalendar => 'ቀን መቁጠሪያ';

  @override
  String get settingsPrimaryCalendar => 'ዋና ቀን መቁጠሪያ';

  @override
  String get settingsPrimaryCalendarEthiopian => 'ኢትዮጵያዊ';

  @override
  String get settingsPrimaryCalendarGregorian => '껑ሮርያ';

  @override
  String get settingsPrimaryCalendarDual => 'দ্বৈত';

  @override
  String get settingsWeekStart => 'ሳምንት መጀመሪያ';

  @override
  String get settingsWeekStartSaturday => 'ቅዳሜ';

  @override
  String get settingsWeekStartSunday => 'እሑድ';

  @override
  String get settingsWeekStartMonday => 'ሰኞ';

  @override
  String get settingsNumeralStyle => 'የቁጥር ዘይቤ';

  @override
  String get settingsNumeralGez => 'ግዕዝ';

  @override
  String get settingsNumeralLatin => 'ላቲን';

  @override
  String get settingsTimezone => 'የጊዜ ዞን';

  @override
  String get settingsTimezoneAddisAbaba => 'አዲስ አበባ';

  @override
  String get settingsTimezoneGMT => 'ጂ.ኤም.ቲ';
}
