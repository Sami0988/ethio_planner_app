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
  String get sectionTodaySchedule => 'Today\'s Schedule';

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
  String get syncWaitingToSync => 'Waiting to sync';

  @override
  String get syncSyncing => 'Syncing…';

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
