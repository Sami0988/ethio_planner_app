// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tigrinya (`ti`).
class AppLocalizationsTi extends AppLocalizations {
  AppLocalizationsTi([String locale = 'ti']) : super(locale);

  @override
  String get appTitle => 'ዋሊያ ፕላነር';

  @override
  String get todayTab => 'ሎሚ';

  @override
  String get calendarTab => 'ካለንደር';

  @override
  String get plannerTab => 'ፕላነር';

  @override
  String get moreTab => 'ተወሳኺ';

  @override
  String get searchLabel => 'ድለይ';

  @override
  String get accountLabel => 'ኣካውንት';

  @override
  String get sectionUpNext => 'ቀጻሊ';

  @override
  String get sectionEvents => 'ፍጻሜታት';

  @override
  String get sectionReminders => 'መዘኻኸሪታት';

  @override
  String get sectionTodaySchedule => 'ናይ ሎሚ መደብ';

  @override
  String get seeAll => 'ንኹሉ ርኣይ';

  @override
  String get quickAddTitle => 'ብቕልጡፍ ወስኽ';

  @override
  String get quickAddEvent => 'ፍጻሜ';

  @override
  String get quickAddReminder => 'መዘኻኸሪ';

  @override
  String get quickAddNote => 'መዘክር';

  @override
  String get reminderOverdue => 'ዝሓለፎ';

  @override
  String get allDay => 'ምሉእ መዓልቲ';

  @override
  String get ecSuffix => 'ዓ.ም.';

  @override
  String get gcSuffix => 'ፈረንጂ';

  @override
  String get emptyTodayTitle => 'ረጋእ ዝበለ ሓድሽ መዓልቲ';

  @override
  String get emptyTodayBody => 'ሎሚ ዝተታሕዘ መደብ የለን። ፍጻሜ፡ መዘኻኸሪ ወይ መዘክር ወስኽ።';

  @override
  String get addSomething => 'ገለ ነገር ወስኽ';

  @override
  String get syncOffline => 'ኦፍላይን';

  @override
  String get syncSavedLocally => 'ኣብ ስልኪ ተዓቂቡ';

  @override
  String get syncWaitingToSync => 'ንምምስሳል ይጽበ ኣሎ';

  @override
  String get syncSyncing => 'ይመሳሰል ኣሎ…';

  @override
  String get syncingLabel => 'ይመሳሰል ኣሎ…';

  @override
  String get syncSynced => 'ተመሳሲሉ';

  @override
  String get syncFailed => 'ምምስሳል ኣይተዓወተን';

  @override
  String get syncRetry => 'ደግም';

  @override
  String get syncRejected => 'ተነጺጉ';

  @override
  String get syncConflict => 'ግርጭት ተረኺቡ';

  @override
  String get syncReview => 'ገምግም';

  @override
  String get syncActionRequired => 'ስጉምቲ የድሊ';

  @override
  String syncWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ለውጥታት ንምምስሳል ይጽበዩ ኣለዉ',
      one: '1 ለውጢ ንምምስሳል ይጽበ ኣሎ',
    );
    return '$_temp0';
  }

  @override
  String get moreReminders => 'መዘኻኸሪታት';

  @override
  String get moreNotes => 'መዘክርታት';

  @override
  String get moreSettings => 'ቅጥያታት';

  @override
  String get moreRecentlyDeleted => 'ቐረባ ግዜ ዝተደምሰሱ';

  @override
  String get settingsTheme => 'ገጽታ';

  @override
  String get settingsThemeSystem => 'ናይ ስርርዓት';

  @override
  String get settingsThemeLight => 'ብሩህ';

  @override
  String get settingsThemeDark => 'ጸሊም';

  @override
  String get settingsLanguage => 'ቋንቋ';

  @override
  String get settingsLanguageSystem => 'ናይ ስርርዓት';

  @override
  String get settingsLanguageEnglish => 'English';

  @override
  String get settingsLanguageAmharic => 'ኣምሓርኛ';

  @override
  String get settingsLanguageOromoo => 'Afaan Oromoo';

  @override
  String get settingsLanguageTigrinya => 'ትግርኛ';

  @override
  String get settingsVersion => 'ቨርሽን';

  @override
  String get authSignIn => 'እቶ';

  @override
  String get authSignUp => 'ተመዝገብ';

  @override
  String get authEmail => 'ኢሜይል';

  @override
  String get authPassword => 'መሕለፊ ቃል';

  @override
  String get authConfirmPassword => 'መሕለፊ ቃል ኣረጋግጽ';

  @override
  String get authName => 'ስም';

  @override
  String get authForgotPassword => 'መሕለፊ ቃል ረሲዕካ?';

  @override
  String get authNoAccount => 'ኣካውንት የብልካን?';

  @override
  String get authHasAccount => 'ኣካውንት ኣለካ?';

  @override
  String get authVerifyEmail => 'ኢሜይል ኣረጋግጽ';

  @override
  String get authVerificationCode => 'ናይ ምርግጋጽ ኮድ';

  @override
  String get authResetPassword => 'መሕለፊ ቃል ቀይር';

  @override
  String get authSendCode => 'ኮድ ስደድ';

  @override
  String get authResetCodeSent => 'ኮድ ተሰዲዱ ኣሎ';

  @override
  String get recentlyDeletedTitle => 'ቐረባ ግዜ ዝተደምሰሱ';

  @override
  String get recentlyDeletedEmpty => 'ዝተደምሰሰ ነገር የለን';

  @override
  String get recentlyDeletedHint => 'ዝተደምሰሱ ነገራት ን30 መዓልታት ኣብዚ ክጸንሑ እዮም';

  @override
  String get recentlyDeletedRestore => 'መለስ';

  @override
  String get recentlyDeletedDelete => 'ደምስስ';

  @override
  String recentlyDeletedDaysLeft(int count) {
    return 'ንሓዋሩ ንምድምሳስ $count መዓልታት ተሪፉ';
  }

  @override
  String get conflictCenterTitle => 'ማእከል ግርጭት';

  @override
  String get conflictCenterEmpty => 'ግርጭት የለን';

  @override
  String get conflictCenterSynced => 'ኹሉ ዳታ ተመሳሲሉ ኣሎ';

  @override
  String get conflictKeepLocal => 'ናይ ስልኪ ኣትርፍ';

  @override
  String get conflictKeepRemote => 'ናይ ኦንላይን ኣትርፍ';

  @override
  String get conflictKeepBoth => 'ንኽልቲኡ ኣትርፍ';

  @override
  String get conflictResolve => 'ፍታሕ';

  @override
  String get notesTitle => 'መዘክርታት';

  @override
  String get notesEmpty => 'መዘክር የለን';

  @override
  String get notesHint => 'መዘክር ንምፍጣር + ጸቅጥ';

  @override
  String get notesPinned => 'ዝተሰኩ';

  @override
  String get notesArchived => 'ዝተዓቀቡ';

  @override
  String get searchEmpty => 'ውጽኢት ኣይተረኽበን';

  @override
  String get searchHint => 'ብኻልእ ቃል ፈትን';

  @override
  String get searchPlaceholder => 'ፍጻሜታት፡ መዘኻኸሪታት፡ መዘክርታት ድለይ...';

  @override
  String searchResults(Object count) {
    return '$count ውጽኢታት';
  }

  @override
  String get plannerFocus => 'ትኹረት';

  @override
  String get plannerPriorities => 'ቀዳምነታት';

  @override
  String get plannerChecklist => 'መጽረዪ ዝርዝር';

  @override
  String get plannerNotes => 'መዘክርታት';

  @override
  String get plannerReflection => 'ግምገማ';

  @override
  String get plannerNoItems => 'ገለ የለን';

  @override
  String get calendarNoEvents => 'ንሎሚ ፍጻሜ የለን';

  @override
  String get calendarNewEvent => 'ሓድሽ ፍጻሜ';

  @override
  String get calendarEditEvent => 'ፍጻሜ ኣስተኻኽል';

  @override
  String get calendarNewReminder => 'ሓድሽ መዘኻኸሪ';

  @override
  String get calendarEditReminder => 'መዘኻኸሪ ኣስተኻኽል';

  @override
  String get calendarTitle => 'ኣርእስቲ';

  @override
  String get calendarLocation => 'ቦታ (ኣማራጺ)';

  @override
  String get calendarCategory => 'መደብ (ኣማራጺ)';

  @override
  String get calendarDescription => 'መግለጺ (ኣማራጺ)';

  @override
  String get calendarAllDay => 'ምሉእ መዓልቲ';

  @override
  String get calendarCreate => 'ፍጠር';

  @override
  String get calendarUpdate => 'ኣድስ';

  @override
  String get calendarNoEventsForDay => 'ንሎሚ ፍጻሜ የለን';

  @override
  String get actionEdit => 'ኣስተኻኽል';

  @override
  String get actionDelete => 'ደምስስ';

  @override
  String get actionCancel => 'ሰርዝ';

  @override
  String get deleteEventConfirmTitle => 'ፍጻሜ ይደምሰስ?';

  @override
  String deleteEventConfirmBody(Object title) {
    return ' \"$title\" ንምድምሳስ ርግጸኛ ዲኻ?';
  }

  @override
  String get eventSaveError => 'ምዕቃብ ኣይተዓወተን';

  @override
  String get editEventTitle => 'ፍጻሜ ኣስተኻኽል';

  @override
  String get newEventTitle => 'ሓድሽ ፍጻሜ';

  @override
  String get fieldTitle => 'ኣርእስቲ';

  @override
  String get fieldTitleRequired => 'ኣርእስቲ የድሊ እዩ';

  @override
  String get fieldLocationOptional => 'ቦታ (ኣማራጺ)';

  @override
  String get fieldCategoryOptional => 'መደብ (ኣማራጺ)';

  @override
  String get fieldDescriptionOptional => 'መግለጺ (ኣማራጺ)';

  @override
  String get categoryNone => 'የለን';

  @override
  String get categoryMeeting => 'ስብሰባ';

  @override
  String get categoryPersonal => 'ብሕታዊ';

  @override
  String get categoryDeadline => 'ጊዜ ገደብ';

  @override
  String get categoryHealth => 'ጤና';

  @override
  String get categoryOther => 'ካልእ';

  @override
  String get actionUpdate => 'ኣድስ';

  @override
  String get actionCreate => 'ፍጠር';

  @override
  String get actionToday => 'ሎሚ';

  @override
  String get today => 'ሎሚ';

  @override
  String eventsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ፍጻሜታት',
      one: '1 ፍጻሜ',
    );
    return '$_temp0';
  }

  @override
  String get jumpToDateTitle => 'ወደ መዓልቲ ኺድ';

  @override
  String get jumpToDateHint => 'መዓልቲ ምረጽ';

  @override
  String get actionGo => 'ኺድ';

  @override
  String get actionSave => 'ዓቅብ';

  @override
  String get filterDay => 'መዓልቲ';

  @override
  String get filterWeek => 'ሰሙን';

  @override
  String get filterMonth => 'ወርሒ';

  @override
  String get filterAll => 'ኹሉ';

  @override
  String get calendarAllEvents => 'ኹሎም ፍጻሜታት';

  @override
  String get settingsCalendar => 'ካለንደር';

  @override
  String get settingsPrimaryCalendar => 'ቀንዲ ካለንደር';

  @override
  String get settingsPrimaryCalendarEthiopian => 'ኢትዮጵያዊ';

  @override
  String get settingsPrimaryCalendarGregorian => 'ፈረንጂ';

  @override
  String get settingsPrimaryCalendarDual => 'ኽልቲኡ';

  @override
  String get settingsWeekStart => 'መጀመርታ ሰሙን';

  @override
  String get settingsWeekStartSaturday => 'ቀዳም';

  @override
  String get settingsWeekStartSunday => 'ሰንበት';

  @override
  String get settingsWeekStartMonday => 'ሰኑይ';

  @override
  String get settingsNumeralStyle => 'ዓይነት ቁጽሪ';

  @override
  String get settingsNumeralGez => 'ግእዝ';

  @override
  String get settingsNumeralLatin => 'ላቲን';

  @override
  String get settingsTimezone => 'ናይ ሰዓት ዞባ';

  @override
  String get settingsTimezoneAddisAbaba => 'ኣዲስ ኣበባ';

  @override
  String get settingsTimezoneGMT => 'GMT';

  @override
  String get onboardingLanguageTitle => 'ቋንቋ ምረጽ';

  @override
  String get onboardingLanguageBody =>
      'ዝጥዕመካ ቋንቋ ምረጽ። ጸኒሕካ ኣብ ቅጥያታት ክትቅይሮ ትኽእል ኢኻ።';

  @override
  String get onboardingIntroBody =>
      'ናይ ኢትዮጵያን ፈረንጅን ካለንደር ዘለዎ፡ መዘኻኸሪታትን መዘክርታትን ዝሓዘ ብሕታዊ ፕላነር። ዳታኻ ኣብ ስልክኻ ጥራይ ይተርፍ።';

  @override
  String get onboardingGetStarted => 'ጀምር';

  @override
  String get onboardingAccountTitle => 'ቀጻሊ ውጥን';

  @override
  String get onboardingAccountBody => 'ዳታኻ ንምዕቃብ ኣካውንት ፍጠር፡ ወይ ከም ጋሻ ቀጽል።';

  @override
  String get onboardingContinueGuest => 'ከም ጋሻ ቀጽል';

  @override
  String get onboardingCreateAccount => 'ኣካውንት ፍጠር';

  @override
  String get onboardingSignIn => 'ኣካውንት ኣለካ? እቶ';

  @override
  String get onboardingGuestTitle => 'ዳታኻ ኣብዚ ይተርፍ';

  @override
  String get onboardingGuestBody =>
      'ዳታ ጋሻ ኣብዚ ስልኪ ጥራይ እዩ ዝዕቀብ። ባክኣፕ ስለ ዘይብሉ ስልኪ እንተተቐይሩ ክጠፍእ ይኽእል እዩ።';

  @override
  String get onboardingGotIt => 'ተረዲኡኒ';

  @override
  String get recurrenceTitle => 'መደጋገሚ ንድፊ';

  @override
  String get recurrenceFrequency => 'ድግግሞሽ';

  @override
  String get recurrenceFreqDaily => 'መዓልታዊ';

  @override
  String get recurrenceFreqWeekly => 'ሰሙናዊ';

  @override
  String get recurrenceFreqMonthly => 'ወርሓዊ';

  @override
  String get recurrenceFreqYearly => 'ዓመታዊ';

  @override
  String get recurrenceInterval => 'ኣብ ነፍሲ ወከፍ';

  @override
  String get recurrenceDay => 'መዓልቲ';

  @override
  String get recurrenceDays => 'መዓልታት';

  @override
  String get recurrenceWeek => 'ሰሙን';

  @override
  String get recurrenceWeeks => 'ሰሙናት';

  @override
  String get recurrenceMonth => 'ወርሒ';

  @override
  String get recurrenceMonths => 'ኣዋርሕ';

  @override
  String get recurrenceYear => 'ዓመት';

  @override
  String get recurrenceYears => 'ዓመታት';

  @override
  String get recurrenceCalendarBasis => 'መሰረት ካለንደር';

  @override
  String get calendarBasisEthiopian => 'ኢትዮጵያዊ';

  @override
  String get calendarBasisGregorian => 'ፈረንጂ';

  @override
  String get recurrenceEnd => 'መወዳእታ';

  @override
  String get recurrenceEndNever => 'መቸም';

  @override
  String get recurrenceEndAfter => 'ድሕሪ';

  @override
  String get recurrenceOccurrences => 'ድግግሞሽ';

  @override
  String get recurrenceEndOnDate => 'ኣብ መዓልቲ';

  @override
  String get recurrencePreview => 'ቅድመ ርእይቶ';

  @override
  String get recurrenceNone => 'ኣይደጋገምን';

  @override
  String get recurrenceClear => 'መደጋገሚ ኣልግስ';

  @override
  String get settingsContentPacks => 'ፓክታት ይዘት';

  @override
  String get settingsEthiopianHolidays => 'በዓላት ኢትዮጵያ';

  @override
  String get settingsEthiopianObservances => 'መዘከርታታት ኢትዮጵያ';

  @override
  String get settingsEnabled => 'በርዩ';

  @override
  String get settingsDisabled => 'ጠፊኡ';

  @override
  String get editOccurrenceTitle => 'ተደጋጋሚ ፍጻሜ ኣስተኻኽል';

  @override
  String get editOccurrenceMessage => 'ነዚ ጥራይ ወይስ ንኹሉ ክትቅይር ትደሊ?';

  @override
  String get editThisOccurrence => 'ነዚ ጥራይ';

  @override
  String get editAllOccurrences => 'ንኹሉ';

  @override
  String get deleteOccurrenceTitle => 'ተደጋጋሚ ፍጻሜ ደምስስ';

  @override
  String get deleteOccurrenceMessage => 'ነዚ ጥራይ ወይስ ንኹሉ ክትደምስስ ትደሊ?';

  @override
  String get deleteThisOccurrence => 'ነዚ ጥራይ';

  @override
  String get deleteAllOccurrences => 'ንኹሉ';

  @override
  String get snoozeReminder => 'ኣቆይ';

  @override
  String get snooze15Minutes => 'ድሕሪ 15 ደቒቕ';

  @override
  String get snooze30Minutes => 'ድሕሪ 30 ደቒቕ';

  @override
  String get snooze1Hour => 'ድሕሪ 1 ሰዓት';

  @override
  String get snooze2Hours => 'ድሕሪ 2 ሰዓት';

  @override
  String get snoozeTomorrow => 'ክሳብ ጽባሕ ኣቆይ (3 ሰዓት)';

  @override
  String get skipOccurrence => 'ሕለፍ';

  @override
  String get skipConfirmation => 'እዚ ፍጻሜ ክሕለፍ እዩ። ካልኦት ኣይትንከፉን።';

  @override
  String get linkToEvent => 'ምስ ፍጻሜ ኣተሓሕዝ';

  @override
  String get linkToReminder => 'ምስ መዘኻኸሪ ኣተሓሕዝ';

  @override
  String get linkToPlanner => 'ምስ ፕላነር ኣተሓሕዝ';

  @override
  String get noItemsToLink => 'ዝተሓሓዝ የለን። ቅድም ፍጠር።';

  @override
  String get reminderSnooze => 'ኣቆይ';

  @override
  String get reminderSkip => 'ሕለፍ';

  @override
  String get reminderCancel => 'መዘኻኸሪ ሰርዝ';

  @override
  String get plannerDay => 'መዓልቲ';

  @override
  String get plannerWeek => 'ሰሙን';

  @override
  String get plannerMonth => 'ወርሒ';

  @override
  String get plannerYear => 'ዓመት';

  @override
  String get plannerSectionFocus => 'ትኹረት';

  @override
  String get plannerSectionPriorities => 'ቀዳምነታት';

  @override
  String get plannerSectionChecklist => 'መጽረዪ ዝርዝር';

  @override
  String get plannerSectionNotes => 'መዘክርታት';

  @override
  String get plannerSectionReflection => 'ግምገማ';

  @override
  String get plannerSectionFocusEmpty => 'ናይ ሎሚ ቀንዲ ትኹረትካ እንታይ እዩ?';

  @override
  String get plannerSectionPrioritiesEmpty => 'ቀዳምነታትካ ወስኽ';

  @override
  String get plannerSectionChecklistEmpty => 'ዝርዝር ስራሓት ወስኽ';

  @override
  String get plannerSectionNotesEmpty => 'መዘክርታት ወስኽ';

  @override
  String get plannerSectionReflectionEmpty => 'ኣብ ከይድኻ ግምገማ ግበር';

  @override
  String get copyFromPreviousTitle => 'ካብ ዝሓለፈ ቅዳሕ';

  @override
  String copyFromPreviousMessage(Object period) {
    return 'ኹሉ ነገራት ካብ ዝሓለፈ $period ቅዳሕ? ዝተደገሙ ክሕለፉ እዮም።';
  }

  @override
  String get carryForwardTitle => 'ዝተረፈ ኣምጽእ';

  @override
  String carryForwardMessage(Object period) {
    return 'ዘይተዛዘሙ ስራሓት ካብ ዝሓለፈ $period ኣምጽእ? ዝተደገሙ ክሕለፉ እዮም።';
  }

  @override
  String copiedItems(Object count) {
    return '$count ነገራት ተቀዲሖም';
  }

  @override
  String carriedItems(Object count) {
    return '$count ነገራት መጺኦም';
  }

  @override
  String get nothingToCopy => 'ካብ ዝሓለፈ ዝቅዳሕ የለን';

  @override
  String get nothingToCarry => 'ዘይተዛዘመ ስራሕ የለን';

  @override
  String get recentlyDeletedConfirmTitle => 'ንሓዋሩ ይደምሰስ?';

  @override
  String recentlyDeletedConfirmBody(Object title) {
    return '\"$title\" ንሓዋሩ ክጠፍእ እዩ። እዚ ክምለስ ኣይክእልን።';
  }

  @override
  String get recentlyDeletedFilterAll => 'ኹሉ';

  @override
  String get recentlyDeletedFilterEvents => 'ፍጻሜታት';

  @override
  String get recentlyDeletedFilterReminders => 'መዘኻኸሪታት';

  @override
  String get recentlyDeletedFilterPlanner => 'ፕላነር';

  @override
  String get recentlyDeletedFilterNotes => 'መዘክርታት';

  @override
  String recentlyDeletedDeletedOn(Object date) {
    return 'ዝተደምሰሰሉ መዓልቲ $date';
  }

  @override
  String get revisionHistory => 'ታሪኽ ለውጥታት';

  @override
  String get restoreRevisionTitle => 'እዚ ስሪት ይመለስ?';

  @override
  String get restoreRevisionBody => 'እዚ ነቲ ሕጂ ዘሎ ይዘት በዚ ስሪት ክትክኦ እዩ።';

  @override
  String get revisionRestored => 'ስሪት ተመሊሱ ኣሎ';

  @override
  String get notificationPermissionTitle => 'ፈቃድ ምልክታ';

  @override
  String get notificationPermissionBody => 'መዘኻኸሪታት ኣብ ሰዓቶም ንምርካብ በጃኹም ፈቃድ ሃቡ።';

  @override
  String get notificationPermissionOK => 'ሕራይ';

  @override
  String get plannerManageSections => 'ክፍልታት ኣስተኻኽል';

  @override
  String get searchCategoryHint => 'መደብ';

  @override
  String get syncTitle => 'ዳታ ኣመሳስል';

  @override
  String get syncClose => 'ዕጸው';

  @override
  String get syncImportGuest => 'ዳታ ጋሻ ኣምጽእ';

  @override
  String get syncNow => 'ሕጂ ኣመሳስል';

  @override
  String get syncReady => 'ንድልው ኣሎ';

  @override
  String get syncComplete => 'ምምስሳል ተዛዚሙ';

  @override
  String get syncConflicts => 'ግርጭታት ተረኺቦም';

  @override
  String get delete => 'ደምስስ';

  @override
  String get deleteNoteConfirmTitle => 'መዘክር ይደምሰስ?';

  @override
  String deleteNoteConfirmBody(Object title) {
    return '\"$title\" ንሓዋሩ ክድምሰስ እዩ።';
  }

  @override
  String get deleteNoteConfirmDelete => 'ደምስስ';

  @override
  String get searchAcrossData => 'ኣብ ኹሉ ዳታ ድለይ';

  @override
  String get searchNoResults => 'ውጽኢት ኣይተረኽበን';

  @override
  String get searchTryDifferent => 'ብኻልእ ቃል ፈትን';

  @override
  String searchResultsCount(Object count) {
    return '$count ውጽኢታት';
  }

  @override
  String get searchFilterTypes => 'ብዓይነት ድለይ';

  @override
  String get searchFilterDateRange => 'ክልል መዓልታት';

  @override
  String get searchFilterCategory => 'መደብ';

  @override
  String get searchClearFilters => 'ኹሉ ኣጽሪ';

  @override
  String get searchAll => 'ኹሉ';

  @override
  String get searchCategoryWork => 'ስራሕ';

  @override
  String get searchCategoryPersonal => 'ብሕታዊ';

  @override
  String get searchCategoryOther => 'ካልእ';

  @override
  String get searchTypeEvents => 'ፍጻሜታት';

  @override
  String get searchTypeReminders => 'መዘኻኸሪታት';

  @override
  String get searchTypePlanner => 'ፕላነር';

  @override
  String get searchTypeNotes => 'መዘክርታት';

  @override
  String get recentlyDeletedTab => 'ቐረባ ግዜ ዝተደምሰሱ';

  @override
  String get pin => 'ስካ';

  @override
  String get unpin => 'ንቀል';

  @override
  String get archive => 'ዓቅብ';

  @override
  String get unarchive => 'ኣውጽእ';

  @override
  String get viewHistory => 'ታሪኽ ርአ';

  @override
  String get plannerItem => 'ናይ ፕላነር ነገር';

  @override
  String get plannerGoToToday => 'ናብ ሎሚ ኺድ';

  @override
  String get healthCategory => 'ጥዕና';

  @override
  String get onboardingSystemLanguage => 'ናይ ስርርዓት';

  @override
  String get navigationPrevious => 'ዝሓለፈ';

  @override
  String get navigationNext => 'ቀጻሊ';

  @override
  String get currentPeriod => 'ናይ ሕጂ';

  @override
  String get add => 'ወስኽ';

  @override
  String get clearSearch => 'ድለያ ኣጽሪ';

  @override
  String get expandFilters => 'ተወሳኺ መጽረዪ';

  @override
  String get collapseFilters => 'መጽረዪ ኣንእስ';

  @override
  String get dateConverterTitle => 'ቀያሪ ዕለት';

  @override
  String get dateConverterSwap => 'ቀይር';

  @override
  String get dateConverterEthiopianDate => 'ዕለት ኢትዮጵያ';

  @override
  String get dateConverterGregorianDate => 'ዕለት ፈረንጂ';

  @override
  String get dateConverterYear => 'ዓመት';

  @override
  String get dateConverterMonth => 'ወርሒ';

  @override
  String get dateConverterDay => 'መዓልቲ';

  @override
  String get dateConverterConvert => 'ቀይር';

  @override
  String get dateConverterResult => 'ውጽኢት';

  @override
  String get moreDateConverter => 'ቀያሪ ዕለት';

  @override
  String get dailyQuoteTitle => 'ናይ ሎሚ መተባብዒ';

  @override
  String get sectionNotes => 'መዘክርታት';

  @override
  String notesMoreCount(int count) {
    return '+$count ተወሳኺ መዘክርታት';
  }

  @override
  String get complete => 'ተዛዚሙ';

  @override
  String get snoozeOneHour => 'ን1 ሰዓት ኣቆይ';

  @override
  String get tapToView => 'ዝርዝር ንምርኣይ ጸቅጥ';

  @override
  String planningStreakTooltip(int count) {
    return 'ናይ $count መዓልቲ ውጥን ተኸታታሊነት';
  }

  @override
  String quickAddLastUsed(String type) {
    return 'ናይ መወዳእታ ዝተጠቐምካሉ: $type';
  }

  @override
  String get eventTypeMeeting => 'ስብሰባ';

  @override
  String get eventTypePersonal => 'ብሕታዊ';

  @override
  String get eventTypeDeadline => 'ጊዜ ገደብ';

  @override
  String get eventTypeHealth => 'ጥዕና';

  @override
  String get eventTypeOther => 'ካልእ';

  @override
  String get settingsNotificationSound => 'ናይ ምልክታ ድምጺ';

  @override
  String get notificationSoundSystem => 'ናይ ስርርዓት';

  @override
  String get notificationSoundSystemDesc => 'ናይ ስልኪ ንቡር ድምጺ ተጠቐም';

  @override
  String get notificationSoundEthiopianBell => 'ቃጭል ኢትዮጵያ';

  @override
  String get notificationSoundGentleChime => 'ረጋእ ዝበለ ቃጭል';

  @override
  String get notificationSoundSoftPing => 'ለስላሳ ድምጺ';

  @override
  String get notificationSoundWarmTone => 'ሙቑ ዝበለ ዜማ';

  @override
  String get notificationSoundCustomDesc => 'ፍሉይ ናይ ምልክታ ድምጺ';
}
