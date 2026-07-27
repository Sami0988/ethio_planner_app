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
  String get sectionTodaySchedule => 'የዛሬ መርሐ ግብር';

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
  String get reminderOverdue => 'ያለፈበት';

  @override
  String get allDay => 'ሙሉ ቀን';

  @override
  String get ecSuffix => 'ዓ.ም.';

  @override
  String get gcSuffix => 'እ.ኤ.አ.';

  @override
  String get emptyTodayTitle => 'ረጋ ያለ አዲስ ቀን';

  @override
  String get emptyTodayBody =>
      'ዛሬ የተያዘ ነገር የለም። ዝግጁ ሲሆኑ ዝግጅት፣ አስታዋሽ ወይም ማስታወሻ ይጨምሩ።';

  @override
  String get addSomething => 'አንድ ነገር ይጨምሩ';

  @override
  String get syncOffline => 'ከመስመር ውጭ';

  @override
  String get syncSavedLocally => 'በስልኩ ላይ ተቀምጧል';

  @override
  String get syncWaitingToSync => 'ለማመሳሰል በመጠባበቅ ላይ';

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
  String get moreSettings => 'ቅንብሮች';

  @override
  String get moreRecentlyDeleted => 'በቅርብ ጊዜ የተሰረዙ';

  @override
  String get settingsTheme => 'ገጽታ';

  @override
  String get settingsThemeSystem => 'የስርዓቱ';

  @override
  String get settingsThemeLight => 'ብርሃን';

  @override
  String get settingsThemeDark => 'ጥቁር';

  @override
  String get settingsLanguage => 'ቋንቋ';

  @override
  String get settingsLanguageSystem => 'የስርዓቱ';

  @override
  String get settingsLanguageEnglish => 'English';

  @override
  String get settingsLanguageAmharic => 'አማርኛ';

  @override
  String get settingsLanguageOromoo => 'Afaan Oromoo';

  @override
  String get settingsLanguageTigrinya => 'ትግርኛ';

  @override
  String get settingsVersion => 'ስሪት';

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
  String get authForgotPassword => 'የይለፍ ቃል ረሱ?';

  @override
  String get authNoAccount => 'መለያ የለዎትም?';

  @override
  String get authHasAccount => 'ቀድሞውኑ መለያ አለዎት?';

  @override
  String get authVerifyEmail => 'ኢሜይል ያረጋግጡ';

  @override
  String get authVerificationCode => 'የማረጋገጫ ኮድ';

  @override
  String get authResetPassword => 'የይለፍ ቃል ያድሱ';

  @override
  String get authSendCode => 'ኮድ ይላኩ';

  @override
  String get authResetCodeSent => 'የማደሻ ኮድ ተልኳል';

  @override
  String get recentlyDeletedTitle => 'በቅርብ ጊዜ የተሰረዙ';

  @override
  String get recentlyDeletedEmpty => 'ምንም የተሰረዘ ነገር የለም';

  @override
  String get recentlyDeletedHint => 'የተሰረዙ ነገሮች ለ30 ቀናት እዚህ ይታያሉ';

  @override
  String get recentlyDeletedRestore => 'መልስ';

  @override
  String get recentlyDeletedDelete => 'ሰርዝ';

  @override
  String recentlyDeletedDaysLeft(int count) {
    return '$count ቀናት በቋሚነት ለመሰረዝ ይቀራሉ';
  }

  @override
  String get conflictCenterTitle => 'የግጭት ማዕከል';

  @override
  String get conflictCenterEmpty => 'ምንም ግጭት የለም';

  @override
  String get conflictCenterSynced => 'ሁሉም መረጃዎች ተመሳስለዋል';

  @override
  String get conflictKeepLocal => 'የስልኩን መረጃ አስቀር';

  @override
  String get conflictKeepRemote => 'የኦንላይኑን መረጃ አስቀር';

  @override
  String get conflictKeepBoth => 'ሁለቱንም አስቀር';

  @override
  String get conflictResolve => 'ፍታ';

  @override
  String get notesTitle => 'ማስታወሻዎች';

  @override
  String get notesEmpty => 'ምንም ማስታወሻ የለም';

  @override
  String get notesHint => 'ማስታወሻ ለመፍጠር + ይጫኑ';

  @override
  String get notesPinned => 'የተሰኩ';

  @override
  String get notesArchived => 'የተቀመጡ';

  @override
  String get searchEmpty => 'ምንም ውጤት አልተገኘም';

  @override
  String get searchHint => 'ሌላ ቃል ይሞክሩ';

  @override
  String get searchPlaceholder => 'ዝግጅቶች፣ አስታዋሾች፣ ማስታወሻዎች ይፈልጉ...';

  @override
  String searchResults(Object count) {
    return '$count ውጤቶች';
  }

  @override
  String get plannerFocus => 'ትኩረት';

  @override
  String get plannerPriorities => 'ቅድሚያ የሚሰጣቸው';

  @override
  String get plannerChecklist => 'የማረጋገጫ ዝርዝር';

  @override
  String get plannerNotes => 'ማስታወሻዎች';

  @override
  String get plannerReflection => 'ግምገማ';

  @override
  String get plannerNoItems => 'ምንም ነገር የለም';

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
  String get calendarCategory => 'ምድብ (አማራጭ)';

  @override
  String get calendarDescription => 'መግለጫ (አማራጭ)';

  @override
  String get calendarAllDay => 'ሙሉ ቀን';

  @override
  String get calendarCreate => 'ፍጠር';

  @override
  String get calendarUpdate => 'አድስ';

  @override
  String get calendarNoEventsForDay => 'ለዚህ ቀን ዝግጅት የለም';

  @override
  String get actionEdit => 'ያስተካክሉ';

  @override
  String get actionDelete => 'ሰርዝ';

  @override
  String get actionCancel => 'ሰርዝ';

  @override
  String get deleteEventConfirmTitle => 'ዝግጅት ይሰረዝ?';

  @override
  String deleteEventConfirmBody(Object title) {
    return ' \"$title\" ለመሰረዝ እርግጠኛ ነዎት?';
  }

  @override
  String get eventSaveError => 'ዝግጅቱን ማስቀመጥ አልተሳካም';

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
  String get fieldCategoryOptional => 'ምድብ (አማራጭ)';

  @override
  String get fieldDescriptionOptional => 'መግለጫ (አማራጭ)';

  @override
  String get categoryNone => 'ምንም';

  @override
  String get categoryMeeting => 'ስብሰባ';

  @override
  String get categoryPersonal => 'የግል';

  @override
  String get categoryDeadline => 'ጊዜ ገደብ';

  @override
  String get categoryHealth => 'ጤና';

  @override
  String get categoryOther => 'ሌላ';

  @override
  String get actionUpdate => 'አድስ';

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
  String get actionSave => 'አስቀምጥ';

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
  String get settingsPrimaryCalendarEthiopian => 'የኢትዮጵያ';

  @override
  String get settingsPrimaryCalendarGregorian => 'የፈረንጅ';

  @override
  String get settingsPrimaryCalendarDual => 'ሁለቱም';

  @override
  String get settingsWeekStart => 'የሳምንቱ መጀመሪያ';

  @override
  String get settingsWeekStartSaturday => 'ቅዳሜ';

  @override
  String get settingsWeekStartSunday => 'እሁድ';

  @override
  String get settingsWeekStartMonday => 'ሰኞ';

  @override
  String get settingsNumeralStyle => 'የቁጥር ዘይቤ';

  @override
  String get settingsNumeralGez => 'ግዕዝ';

  @override
  String get settingsNumeralLatin => 'ላቲን';

  @override
  String get settingsTimezone => 'የሰዓት ቀጠና';

  @override
  String get settingsTimezoneAddisAbaba => 'አዲስ አበባ';

  @override
  String get settingsTimezoneGMT => 'GMT';

  @override
  String get onboardingLanguageTitle => 'ቋንቋ ይምረጡ';

  @override
  String get onboardingLanguageBody =>
      'የሚመርጡትን ቋንቋ ይምረጡ። ይህንን በኋላ በቅንብሮች ውስጥ መቀየር ይችላሉ።';

  @override
  String get onboardingIntroBody =>
      'የኢትዮጵያ እና የግሪጎሪያን ቀን መቁጠሪያ ያለው፣ አስታዋሾች እና ማስታወሻዎች የያዘ የግል ፕላነር። መረጃዎ በስልክዎ ላይ ብቻ ይቆያል።';

  @override
  String get onboardingGetStarted => 'ጀምር';

  @override
  String get onboardingAccountTitle => 'ቀጣይነት ያለው እቅድ';

  @override
  String get onboardingAccountBody =>
      'መረጃዎን ለማስቀመጥ እና በሌሎች መሳሪያዎች ለማግኘት መለያ ይፍጠሩ፣ ወይም በእንግዳነት ይቀጥሉ።';

  @override
  String get onboardingContinueGuest => 'በእንግዳነት ቀጥል';

  @override
  String get onboardingCreateAccount => 'መለያ ፍጠር';

  @override
  String get onboardingSignIn => 'ቀድሞውኑ መለያ አለዎት? ይግቡ';

  @override
  String get onboardingGuestTitle => 'መረጃዎ እዚህ ይቆያል';

  @override
  String get onboardingGuestBody =>
      'የእንግዳ መረጃ በዚህ መሳሪያ ላይ ብቻ ነው የሚቀመጠው። ባክአፕ ስለማይኖረው መተግበሪያውን ቢሰርዙት ሊጠፋ ይችላል። በኋላ መለያ በመፍጠር መረጃዎን ማስተላለፍ ይችላሉ።';

  @override
  String get onboardingGotIt => 'ተረድቻለሁ';

  @override
  String get recurrenceTitle => 'የመደጋገም ሁኔታ';

  @override
  String get recurrenceFrequency => 'ድግግሞሽ';

  @override
  String get recurrenceFreqDaily => 'በየቀኑ';

  @override
  String get recurrenceFreqWeekly => 'በየሳምንቱ';

  @override
  String get recurrenceFreqMonthly => 'በየወሩ';

  @override
  String get recurrenceFreqYearly => 'በየዓመቱ';

  @override
  String get recurrenceInterval => 'በየ';

  @override
  String get recurrenceDay => 'ቀን';

  @override
  String get recurrenceDays => 'ቀናት';

  @override
  String get recurrenceWeek => 'ሳምንት';

  @override
  String get recurrenceWeeks => 'ሳምንታት';

  @override
  String get recurrenceMonth => 'ወር';

  @override
  String get recurrenceMonths => 'ወራት';

  @override
  String get recurrenceYear => 'ዓመት';

  @override
  String get recurrenceYears => 'ዓመታት';

  @override
  String get recurrenceCalendarBasis => 'የቀን መቁጠሪያ መሠረት';

  @override
  String get calendarBasisEthiopian => 'የኢትዮጵያ';

  @override
  String get calendarBasisGregorian => 'የፈረንጅ';

  @override
  String get recurrenceEnd => 'ያበቃል';

  @override
  String get recurrenceEndNever => 'መቼም';

  @override
  String get recurrenceEndAfter => 'ከ';

  @override
  String get recurrenceOccurrences => 'ድግግሞሾች በኋላ';

  @override
  String get recurrenceEndOnDate => 'በቀን';

  @override
  String get recurrencePreview => 'ቅድመ እይታ';

  @override
  String get recurrenceNone => 'አይደጋገም';

  @override
  String get recurrenceClear => 'መደጋገሙን አንሳ';

  @override
  String get settingsContentPacks => 'የይዘት ጥቅሎች';

  @override
  String get settingsEthiopianHolidays => 'የኢትዮጵያ በዓላት';

  @override
  String get settingsEthiopianObservances => 'የኢትዮጵያ መታሰቢያ ቀናት';

  @override
  String get settingsEnabled => 'በርቷል';

  @override
  String get settingsDisabled => 'ጠፍቷል';

  @override
  String get editOccurrenceTitle => 'ተደጋጋሚ ዝግጅት ያስተካክሉ';

  @override
  String get editOccurrenceMessage =>
      'ይህንን ዝግጅት ብቻ ወይስ ሁሉንም ተደጋጋሚ ዝግጅቶች ማስተካከል ይፈልጋሉ?';

  @override
  String get editThisOccurrence => 'ይህንን ብቻ';

  @override
  String get editAllOccurrences => 'ሁሉንም';

  @override
  String get deleteOccurrenceTitle => 'ተደጋጋሚ ዝግጅት ይሰረዝ?';

  @override
  String get deleteOccurrenceMessage =>
      'ይህንን ዝግጅት ብቻ ወይስ ሁሉንም ተደጋጋሚ ዝግጅቶች መሰረዝ ይፈልጋሉ?';

  @override
  String get deleteThisOccurrence => 'ይህንን ብቻ';

  @override
  String get deleteAllOccurrences => 'ሁሉንም';

  @override
  String get snoozeReminder => 'አስታዋሽ አቆይ';

  @override
  String get snooze15Minutes => 'ከ15 ደቂቃ በኋላ';

  @override
  String get snooze30Minutes => 'ከ30 ደቂቃ በኋላ';

  @override
  String get snooze1Hour => 'ከ1 ሰዓት በኋላ';

  @override
  String get snooze2Hours => 'ከ2 ሰዓት በኋላ';

  @override
  String get snoozeTomorrow => 'እስከ ነገ አቆይ (3 ሰዓት)';

  @override
  String get skipOccurrence => 'ዝለል';

  @override
  String get skipConfirmation => 'ይህ ዝግጅት ይታለፋል። ሌሎች ተደጋጋሚ ዝግጅቶች አይነኩም።';

  @override
  String get linkToEvent => 'ከዝግጅት ጋር አያይዝ';

  @override
  String get linkToReminder => 'ከአስታዋሽ ጋር አያይዝ';

  @override
  String get linkToPlanner => 'ከፕላነር ጋር አያይዝ';

  @override
  String get noItemsToLink => 'ለማያያዝ ምንም ነገር የለም። መጀመሪያ ይፍጠሩ።';

  @override
  String get reminderSnooze => 'አቆይ';

  @override
  String get reminderSkip => 'ዝለል';

  @override
  String get reminderCancel => 'አስታዋሹን ሰርዝ';

  @override
  String get plannerDay => 'ቀን';

  @override
  String get plannerWeek => 'ሳምንት';

  @override
  String get plannerMonth => 'ወር';

  @override
  String get plannerYear => 'ዓመት';

  @override
  String get plannerSectionFocus => 'ትኩረት';

  @override
  String get plannerSectionPriorities => 'ቅድሚያዎች';

  @override
  String get plannerSectionChecklist => 'የማረጋገጫ ዝርዝር';

  @override
  String get plannerSectionNotes => 'ማስታወሻዎች';

  @override
  String get plannerSectionReflection => 'ግምገማ';

  @override
  String get plannerSectionFocusEmpty => 'ዛሬ ዋና ትኩረትዎ ምንድነው?';

  @override
  String get plannerSectionPrioritiesEmpty => 'ዋና ቅድሚያዎችዎን ይጨምሩ';

  @override
  String get plannerSectionChecklistEmpty => 'የሚከናወኑ ነገሮችን ይጨምሩ';

  @override
  String get plannerSectionNotesEmpty => 'ለዚህ ጊዜ ማስታወሻዎችን ይጨምሩ';

  @override
  String get plannerSectionReflectionEmpty => 'በሂደትዎ ላይ ግምገማ ያድርጉ';

  @override
  String get copyFromPreviousTitle => 'ከቀደመው ቅዳ';

  @override
  String copyFromPreviousMessage(Object period) {
    return 'ሁሉንም ነገሮች ከቀደመው $period ወደ ዛሬ ይቅዱ? ተመሳሳይ የሆኑት ይታለፋሉ።';
  }

  @override
  String get carryForwardTitle => 'ያልተጠናቀቁትን አምጣ';

  @override
  String carryForwardMessage(Object period) {
    return 'ያልተጠናቀቁ ነገሮችን ከቀደመው $period ወደ ዛሬ ያምጡ? ተመሳሳይ የሆኑት ይታለፋሉ።';
  }

  @override
  String copiedItems(Object count) {
    return '$count ነገሮች ተቀድተዋል';
  }

  @override
  String carriedItems(Object count) {
    return '$count ነገሮች ወደ ዛሬ መጥተዋል';
  }

  @override
  String get nothingToCopy => 'ከቀደመው ጊዜ የሚቀዳ ምንም ነገር የለም';

  @override
  String get nothingToCarry => 'የሚመጣ ያልተጠናቀቀ ነገር የለም';

  @override
  String get recentlyDeletedConfirmTitle => 'በቋሚነት ይሰረዝ?';

  @override
  String recentlyDeletedConfirmBody(Object title) {
    return '\"$title\" በቋሚነት ይጠፋል። ይህ እርምጃ ሊመለስ አይችልም።';
  }

  @override
  String get recentlyDeletedFilterAll => 'ሁሉም';

  @override
  String get recentlyDeletedFilterEvents => 'ዝግጅቶች';

  @override
  String get recentlyDeletedFilterReminders => 'አስታዋሾች';

  @override
  String get recentlyDeletedFilterPlanner => 'ፕላነር';

  @override
  String get recentlyDeletedFilterNotes => 'ማስታወሻዎች';

  @override
  String recentlyDeletedDeletedOn(Object date) {
    return 'የተሰረዘበት ቀን $date';
  }

  @override
  String get revisionHistory => 'የለውጥ ታሪክ';

  @override
  String get restoreRevisionTitle => 'ይህ ስሪት ይመለስ?';

  @override
  String get restoreRevisionBody => 'ይህ የአሁኑን ማስታወሻ ይዘት በዚህ ስሪት ይተካዋል።';

  @override
  String get revisionRestored => 'ስሪቱ ተመልሷል';

  @override
  String get notificationPermissionTitle => 'የማሳወቂያ ፈቃድ';

  @override
  String get notificationPermissionBody => 'አስታዋሾችን በሰዓቱ ለማግኘት እባክዎ ፈቃድ ይስጡ።';

  @override
  String get notificationPermissionOK => 'እሺ';

  @override
  String get plannerManageSections => 'ክፍሎችን አስተካክል';

  @override
  String get searchCategoryHint => 'ምድብ';

  @override
  String get syncTitle => 'መረጃ አመሳስል';

  @override
  String get syncClose => 'ዝጋ';

  @override
  String get syncImportGuest => 'የእንግዳ መረጃን አምጣ';

  @override
  String get syncNow => 'አሁን አመሳስል';

  @override
  String get syncReady => 'ለማመሳሰል ዝግጁ ነው';

  @override
  String get syncComplete => 'ማመሳሰል ተጠናቋል';

  @override
  String get syncConflicts => 'ግጭቶች ተገኝተዋል';

  @override
  String get delete => 'ሰርዝ';

  @override
  String get deleteNoteConfirmTitle => 'ማስታወሻ ይሰረዝ?';

  @override
  String deleteNoteConfirmBody(Object title) {
    return '\"$title\" በቋሚነት ይሰረዛል።';
  }

  @override
  String get deleteNoteConfirmDelete => 'ሰርዝ';

  @override
  String get searchAcrossData => 'ሁሉንም መረጃዎች ፈልግ';

  @override
  String get searchNoResults => 'ምንም ውጤት አልተገኘም';

  @override
  String get searchTryDifferent => 'ሌላ ቃል ይሞክሩ';

  @override
  String searchResultsCount(Object count) {
    return '$count ውጤቶች';
  }

  @override
  String get searchFilterTypes => 'በአይነት ፈልግ';

  @override
  String get searchFilterDateRange => 'የቀን ገደብ';

  @override
  String get searchFilterCategory => 'ምድብ';

  @override
  String get searchClearFilters => 'ሁሉንም አጽዳ';

  @override
  String get searchAll => 'ሁሉም';

  @override
  String get searchCategoryWork => 'ስራ';

  @override
  String get searchCategoryPersonal => 'የግል';

  @override
  String get searchCategoryOther => 'ሌላ';

  @override
  String get searchTypeEvents => 'ዝግጅቶች';

  @override
  String get searchTypeReminders => 'አስታዋሾች';

  @override
  String get searchTypePlanner => 'ፕላነር';

  @override
  String get searchTypeNotes => 'ማስታወሻዎች';

  @override
  String get recentlyDeletedTab => 'በቅርብ ጊዜ የተሰረዙ';

  @override
  String get pin => 'ስካ';

  @override
  String get unpin => 'ንቀል';

  @override
  String get archive => 'አስቀምጥ';

  @override
  String get unarchive => 'አውጣ';

  @override
  String get viewHistory => 'ታሪክ ይመልከቱ';

  @override
  String get plannerItem => 'የፕላነር ነገር';

  @override
  String get plannerGoToToday => 'ወደ ዛሬ ሂድ';

  @override
  String get healthCategory => 'ጤና';

  @override
  String get onboardingSystemLanguage => 'የስርዓቱ';

  @override
  String get navigationPrevious => 'ቀዳሚ';

  @override
  String get navigationNext => 'ቀጣይ';

  @override
  String get currentPeriod => 'የአሁኑ';

  @override
  String get add => 'ጨምር';

  @override
  String get clearSearch => 'ፍለጋውን አጽዳ';

  @override
  String get expandFilters => 'ተጨማሪ ማጣሪያዎች';

  @override
  String get collapseFilters => 'ማጣሪያዎችን አሳንስ';

  @override
  String get dateConverterTitle => 'የቀን መለወጫ';

  @override
  String get dateConverterSwap => 'ቀይር';

  @override
  String get dateConverterEthiopianDate => 'የኢትዮጵያ ቀን';

  @override
  String get dateConverterGregorianDate => 'የፈረንጅ ቀን';

  @override
  String get dateConverterYear => 'ዓመት';

  @override
  String get dateConverterMonth => 'ወር';

  @override
  String get dateConverterDay => 'ቀን';

  @override
  String get dateConverterConvert => 'ቀይር';

  @override
  String get dateConverterResult => 'ውጤት';

  @override
  String get moreDateConverter => 'የቀን መለወጫ';

  @override
  String get dailyQuoteTitle => 'የዕለት ጥቅስ';

  @override
  String get sectionNotes => 'ማስታወሻዎች';

  @override
  String notesMoreCount(int count) {
    return '+$count ተጨማሪ ማስታወሻዎች';
  }

  @override
  String get complete => 'ተጠናቋል';

  @override
  String get snoozeOneHour => 'ለ1 ሰዓት አቆይ';

  @override
  String get tapToView => 'ዝርዝሩን ለማየት ይንኩ';

  @override
  String planningStreakTooltip(int count) {
    return 'የ$count ቀን የእቅድ ተከታታይነት';
  }

  @override
  String quickAddLastUsed(String type) {
    return 'ለመጨረሻ ጊዜ ጥቅም ላይ የዋለ: $type';
  }

  @override
  String get eventTypeMeeting => 'ስብሰባ';

  @override
  String get eventTypePersonal => 'የግል';

  @override
  String get eventTypeDeadline => 'ጊዜ ገደብ';

  @override
  String get eventTypeHealth => 'ጤና';

  @override
  String get eventTypeOther => 'ሌላ';

  @override
  String get settingsNotificationSound => 'የማሳወቂያ ድምጽ';

  @override
  String get notificationSoundSystem => 'የስርዓቱ';

  @override
  String get notificationSoundSystemDesc => 'የስልክዎን ነባሪ የማሳወቂያ ድምጽ ይጠቀሙ';

  @override
  String get notificationSoundEthiopianBell => 'የኢትዮጵያ ደወል';

  @override
  String get notificationSoundGentleChime => 'ረጋ ያለ ቃጭል';

  @override
  String get notificationSoundSoftPing => 'ለስላሳ ድምጽ';

  @override
  String get notificationSoundWarmTone => 'ሞቅ ያለ ዜማ';

  @override
  String get notificationSoundCustomDesc => 'የተለየ የማሳወቂያ ድምጽ';
}
