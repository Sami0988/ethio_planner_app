// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Oromo (`om`).
class AppLocalizationsOm extends AppLocalizations {
  AppLocalizationsOm([String locale = 'om']) : super(locale);

  @override
  String get appTitle => 'Walia Planner';

  @override
  String get todayTab => 'Har\'a';

  @override
  String get calendarTab => 'Barruu';

  @override
  String get plannerTab => 'Planner';

  @override
  String get moreTab => 'Biiroo';

  @override
  String get searchLabel => 'Baradhu';

  @override
  String get accountLabel => 'Herrega';

  @override
  String get sectionUpNext => 'Itti Aanu';

  @override
  String get sectionEvents => 'Sadetta';

  @override
  String get sectionReminders => 'Yaadannoowwan';

  @override
  String get sectionTodaySchedule => 'Gosa Har\'a';

  @override
  String get seeAll => 'Hunda Dubbisi';

  @override
  String get quickAddTitle => 'Argama Dhiressaa';

  @override
  String get quickAddEvent => 'Sadetta';

  @override
  String get quickAddReminder => 'Yaadanno';

  @override
  String get quickAddNote => 'Barruu';

  @override
  String get reminderOverdue => 'Itti Dhaamtan';

  @override
  String get allDay => 'Guyyaa Guutuu';

  @override
  String get ecSuffix => 'EC';

  @override
  String get gcSuffix => 'GC';

  @override
  String get emptyTodayTitle => 'Guyyaa qulqullinaa fi haaraa';

  @override
  String get emptyTodayBody =>
      'Har\'a sadetta hin jirtu. Wanti ni dandeenye, sadetta, yaadanno ykn barruu ida\'i.';

  @override
  String get addSomething => 'Wanti ida\'i';

  @override
  String get syncOffline => 'Ala Aaggii';

  @override
  String get syncSavedLocally => 'Naannoo kana irratti ka\'e';

  @override
  String get syncWaitingToSync => 'Jalqaba ta\'uu qabu eegala jira';

  @override
  String get syncSyncing => 'Jalqabaa jira…';

  @override
  String get syncingLabel => 'Jalqabaa jira…';

  @override
  String get syncSynced => 'Walsimsii\'a';

  @override
  String get syncFailed => 'Jalqaba hin milkaa\'in';

  @override
  String get syncRetry => 'Irra Deebi\'i';

  @override
  String get syncRejected => 'Dhiifama';

  @override
  String get syncConflict => 'Rakkoo uumamaa';

  @override
  String get syncReview => 'Illee Illee';

  @override
  String get syncActionRequired => 'Gocha Barbaachisa';

  @override
  String syncWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jijjiiramawwan jalqaba ta\'uu qabu',
      one: '1 jijjiirama jalqaba ta\'uu qabu',
    );
    return '$_temp0';
  }

  @override
  String get moreReminders => 'Yaadannoowwan';

  @override
  String get moreNotes => 'Barruuwwan';

  @override
  String get morePrint => 'Waraabbii Studio';

  @override
  String get moreSettings => 'Qindaa\'inaa';

  @override
  String get moreRecentlyDeleted => 'Haqameeraan Haqamee';

  @override
  String get settingsTheme => 'Haallii';

  @override
  String get settingsThemeSystem => 'Siraa';

  @override
  String get settingsThemeLight => 'Ifaa';

  @override
  String get settingsThemeDark => 'Dunkaa';

  @override
  String get settingsLanguage => 'Afaan';

  @override
  String get settingsLanguageSystem => 'Siraa';

  @override
  String get settingsLanguageEnglish => 'Ingiliffaa';

  @override
  String get settingsLanguageAmharic => 'Amaariffaa';

  @override
  String get settingsLanguageOromoo => 'Afaan Oromoo';

  @override
  String get settingsLanguageTigrinya => 'Tigrinya';

  @override
  String get settingsVersion => 'Vershin';

  @override
  String get authSignIn => 'Seeni';

  @override
  String get authSignUp => 'Galmaa\'u';

  @override
  String get authEmail => 'Imeeyilii';

  @override
  String get authPassword => 'Jecha Darbii';

  @override
  String get authConfirmPassword => 'Jecha Darbii Mirkaneessi';

  @override
  String get authName => 'Maqaa';

  @override
  String get authForgotPassword => 'Jecha darbii irraanfatte?';

  @override
  String get authNoAccount => 'Herrega hin qabdu?';

  @override
  String get authHasAccount => 'Herrega qabdu?';

  @override
  String get authVerifyEmail => 'Imeeyilii Mirkaneessi';

  @override
  String get authVerificationCode => 'Lakkoofsa Mirkaneessaa';

  @override
  String get authResetPassword => 'Jecha Darbii Haaromsi';

  @override
  String get authSendCode => 'Lakkoofsa Ergi';

  @override
  String get authResetCodeSent => 'Lakkoofsa haaromsii ergameera';

  @override
  String get recentlyDeletedTitle => 'Haqameeraan Haqamee';

  @override
  String get recentlyDeletedEmpty => 'Haqameeraan haqamee hin jiru';

  @override
  String get recentlyDeletedHint =>
      'Haqameeraan haqamee guyyaa 30 naannoo kana arifama';

  @override
  String get recentlyDeletedRestore => 'Haasiisi';

  @override
  String get recentlyDeletedDelete => 'Haqi';

  @override
  String recentlyDeletedDaysLeft(Object count) {
    return 'Haquu gara guyyaa $count';
  }

  @override
  String get conflictCenterTitle => 'Kutaan Rakkoo';

  @override
  String get conflictCenterEmpty => 'Rakko hin jiru';

  @override
  String get conflictCenterSynced => 'Otuun hunda walsimsii\'a';

  @override
  String get conflictKeepLocal => 'Miseensaa naannoo haasiisi';

  @override
  String get conflictKeepRemote => 'Miseensaa alaa haasiisi';

  @override
  String get conflictKeepBoth => 'Lamaan haasiisi';

  @override
  String get conflictResolve => 'Fudhu';

  @override
  String get notesTitle => 'Barruuwwan';

  @override
  String get notesEmpty => 'Barruuwwan hin jiru';

  @override
  String get notesHint => 'Barruu uumuuf + cuqisi';

  @override
  String get notesPinned => 'Cinisamee';

  @override
  String get notesArchived => 'Ka\'aa\'amee';

  @override
  String get searchEmpty => 'Acii hin argamne';

  @override
  String get searchHint => 'Barreessa gootheraa yaali';

  @override
  String get searchPlaceholder =>
      'Sadetta, yaadannoowwan, barruuwwan baradhu...';

  @override
  String searchResults(Object count) {
    return 'Acii $count';
  }

  @override
  String get plannerFocus => 'Xiyyeeffannoo';

  @override
  String get plannerPriorities => 'Dursa';

  @override
  String get plannerChecklist => 'Tarree Mirkaneessaa';

  @override
  String get plannerNotes => 'Barruuwwan';

  @override
  String get plannerReflection => 'Yaadannoo';

  @override
  String get plannerNoItems => 'Wanti hin jiru';

  @override
  String get calendarNoEvents => 'Guyyaa kanaaf sadetta hin jirtu';

  @override
  String get calendarNewEvent => 'Sadetta Haaraa';

  @override
  String get calendarEditEvent => 'Sadetta Fakki';

  @override
  String get calendarNewReminder => 'Yaadanno Haaraa';

  @override
  String get calendarEditReminder => 'Yaadanno Fakki';

  @override
  String get calendarTitle => 'Mata duree';

  @override
  String get calendarLocation => 'Naannoo (ni toluu)';

  @override
  String get calendarCategory => 'Gosa (ni toluu)';

  @override
  String get calendarDescription => 'Ibsa (ni toluu)';

  @override
  String get calendarAllDay => 'Guyyaa guutuu';

  @override
  String get calendarCreate => 'Uumi';

  @override
  String get calendarUpdate => 'Haaromsi';

  @override
  String get calendarNoEventsForDay => 'Guyyaa kanaaf sadetta hin jirtu';

  @override
  String get actionEdit => 'Fakki';

  @override
  String get actionDelete => 'Haqi';

  @override
  String get actionCancel => 'Haqii';

  @override
  String get deleteEventConfirmTitle => 'Sadetta Haqi';

  @override
  String deleteEventConfirmBody(Object title) {
    return '\"$title\" haquu ni mirkannaatda?';
  }

  @override
  String get eventSaveError => 'Sadetta ka\'uu hin milkaa\'in';

  @override
  String get editEventTitle => 'Sadetta Fakki';

  @override
  String get newEventTitle => 'Sadetta Haaraa';

  @override
  String get fieldTitle => 'Mata duree';

  @override
  String get fieldTitleRequired => 'Mata duree barbaachisa';

  @override
  String get fieldLocationOptional => 'Naannoo (ni toluu)';

  @override
  String get fieldCategoryOptional => 'Gosa (ni toluu)';

  @override
  String get fieldDescriptionOptional => 'Ibsa (ni toluu)';

  @override
  String get categoryNone => 'Mituu';

  @override
  String get categoryWork => 'Dalaga';

  @override
  String get categoryPersonal => 'Dhuunfa';

  @override
  String get categoryHoliday => 'Ayyaana';

  @override
  String get categoryOther => 'Biyyoo';

  @override
  String get actionUpdate => 'Haaromsi';

  @override
  String get actionCreate => 'Uumi';

  @override
  String get actionToday => 'Har\'a';

  @override
  String get today => 'Har\'a';

  @override
  String eventsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sadetta',
      one: '1 sadetta',
    );
    return '$_temp0';
  }

  @override
  String get jumpToDateTitle => 'Guyyaa keessatti boru';

  @override
  String get jumpToDateHint => 'Guyyaa filadhu';

  @override
  String get actionGo => 'Bori';

  @override
  String get filterDay => 'Guyyaa';

  @override
  String get filterWeek => 'Torbe';

  @override
  String get filterMonth => 'Jiicha';

  @override
  String get filterAll => 'Hunda';

  @override
  String get calendarAllEvents => 'Sadetta Hunda';

  @override
  String get settingsCalendar => 'Barruu';

  @override
  String get settingsPrimaryCalendar => 'Barruu Dursaa';

  @override
  String get settingsPrimaryCalendarEthiopian => 'Itoophiyaa';

  @override
  String get settingsPrimaryCalendarGregorian => 'Greegoriyaa';

  @override
  String get settingsPrimaryCalendarDual => 'Lama';

  @override
  String get settingsWeekStart => 'Bu\'uun Jarri';

  @override
  String get settingsWeekStartSaturday => 'Sanbata';

  @override
  String get settingsWeekStartSunday => 'Dilbata';

  @override
  String get settingsWeekStartMonday => 'Wixata';

  @override
  String get settingsNumeralStyle => 'Lakka\'oo';

  @override
  String get settingsNumeralGez => 'Ge\'ez';

  @override
  String get settingsNumeralLatin => 'Laatinii';

  @override
  String get settingsTimezone => 'Yeroo Naannoo';

  @override
  String get settingsTimezoneAddisAbaba => 'Addis Ababa';

  @override
  String get settingsTimezoneGMT => 'GMT';
}
