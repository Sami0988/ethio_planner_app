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
  String get calendarTab => 'Kaalandara';

  @override
  String get plannerTab => 'Pilaanera';

  @override
  String get moreTab => 'Dabalata';

  @override
  String get searchLabel => 'Barbaadi';

  @override
  String get accountLabel => 'Herrega';

  @override
  String get sectionUpNext => 'Itti Aanu';

  @override
  String get sectionEvents => 'Gochaawwan';

  @override
  String get sectionReminders => 'Yaadachiiftota';

  @override
  String get sectionTodaySchedule => 'Sagantaa Har\'aa';

  @override
  String get seeAll => 'Hunda ilaali';

  @override
  String get quickAddTitle => 'Dafii Ida\'i';

  @override
  String get quickAddEvent => 'Gocha';

  @override
  String get quickAddReminder => 'Yaadachiiftuu';

  @override
  String get quickAddNote => 'Barruu';

  @override
  String get reminderOverdue => 'Yeroon Darbeera';

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
      'Har\'a gochi karoorfame hin jiru. Yeroo qophii taatu gocha, yaadachiiftuu ykn barruu ida\'i.';

  @override
  String get addSomething => 'Wanti ida\'i';

  @override
  String get syncOffline => 'Ala Aaggii';

  @override
  String get syncSavedLocally => 'Meeshaa kana irratti ka\'e';

  @override
  String get syncWaitingToSync => 'Walsimsiisuuf eeggachaa jira';

  @override
  String get syncSyncing => 'Walsimsiisaa jira…';

  @override
  String get syncingLabel => 'Walsimsiisaa jira…';

  @override
  String get syncSynced => 'Walsimsiifameera';

  @override
  String get syncFailed => 'Walsimsiisuun hin milkaa\'in';

  @override
  String get syncRetry => 'Irra Deebi\'i';

  @override
  String get syncRejected => 'Dhiifama';

  @override
  String get syncConflict => 'Walitti bu\'iinsi uumameera';

  @override
  String get syncReview => 'Irra deebi\'ii ilaali';

  @override
  String get syncActionRequired => 'Tarkaanfii barbaachisa';

  @override
  String syncWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Jijjiiramawwan $count walsimsiisuuf eeggachaa jiru',
      one: 'Jijjiirama 1 walsimsiisuuf eeggachaa jira',
    );
    return '$_temp0';
  }

  @override
  String get moreReminders => 'Yaadachiiftota';

  @override
  String get moreNotes => 'Barruuwwan';

  @override
  String get moreSettings => 'Qindaa\'ina';

  @override
  String get moreRecentlyDeleted => 'Dhiheenya Kan Haqame';

  @override
  String get settingsTheme => 'Bifa';

  @override
  String get settingsThemeSystem => 'Sirna';

  @override
  String get settingsThemeLight => 'Ifaa';

  @override
  String get settingsThemeDark => 'Dukkana';

  @override
  String get settingsLanguage => 'Afaan';

  @override
  String get settingsLanguageSystem => 'Sirna';

  @override
  String get settingsLanguageEnglish => 'English';

  @override
  String get settingsLanguageAmharic => 'Amharic';

  @override
  String get settingsLanguageOromoo => 'Afaan Oromoo';

  @override
  String get settingsLanguageTigrinya => 'Tigrinya';

  @override
  String get settingsVersion => 'Veshinii';

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
  String get authHasAccount => 'Duraan herrega qabdu?';

  @override
  String get authVerifyEmail => 'Imeeyilii Mirkaneessi';

  @override
  String get authVerificationCode => 'Koodii Mirkaneessaa';

  @override
  String get authResetPassword => 'Jecha Darbii Haaromsi';

  @override
  String get authSendCode => 'Koodii Ergi';

  @override
  String get authResetCodeSent => 'Koodiin haaromsii ergameera';

  @override
  String get recentlyDeletedTitle => 'Dhiheenya Kan Haqame';

  @override
  String get recentlyDeletedEmpty => 'Haqameeraan haqamee hin jiru';

  @override
  String get recentlyDeletedHint => 'Wanti haqame guyyaa 30f asitti mul\'ata';

  @override
  String get recentlyDeletedRestore => 'Deebisi';

  @override
  String get recentlyDeletedDelete => 'Haqi';

  @override
  String recentlyDeletedDaysLeft(int count) {
    return 'Haqamuuf guyyaa $count hafe';
  }

  @override
  String get conflictCenterTitle => 'Wiirtuu Walitti Bu\'iinsaa';

  @override
  String get conflictCenterEmpty => 'Walitti bu\'iinsi hin jiru';

  @override
  String get conflictCenterSynced => 'Deetaan kee hundi walsimsiifameera';

  @override
  String get conflictKeepLocal => 'Kan biyya keessaa hambisi';

  @override
  String get conflictKeepRemote => 'Kan alaa hambisi';

  @override
  String get conflictKeepBoth => 'Lamaan hambisi';

  @override
  String get conflictResolve => 'Hiiki';

  @override
  String get notesTitle => 'Barruuwwan';

  @override
  String get notesEmpty => 'Barruuwwan hin jiru';

  @override
  String get notesHint => 'Barruu uumuuf + cuqisi';

  @override
  String get notesPinned => 'Kabsaalamee';

  @override
  String get notesArchived => 'Kuufamee';

  @override
  String get searchEmpty => 'Bu\'aan hin argamne';

  @override
  String get searchHint => 'Gochaawwan, yaadachiiftota, barruuwwan barbaadi';

  @override
  String get searchPlaceholder =>
      'Gochaawwan, yaadachiiftota, barruuwwan barbaadi...';

  @override
  String searchResults(Object count) {
    return 'Bu\'aa $count';
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
  String get calendarNoEvents => 'Guyyaa kanaaf gochi hin jiru';

  @override
  String get calendarNewEvent => 'Gocha Haaraa';

  @override
  String get calendarEditEvent => 'Gocha Gulaali';

  @override
  String get calendarNewReminder => 'Yaadachiiftuu Haaraa';

  @override
  String get calendarEditReminder => 'Yaadachiiftuu Gulaali';

  @override
  String get calendarTitle => 'Mata duree';

  @override
  String get calendarLocation => 'Iddoo (ni danda\'ama)';

  @override
  String get calendarCategory => 'Ramaddii (ni danda\'ama)';

  @override
  String get calendarDescription => 'Ibsa (ni danda\'ama)';

  @override
  String get calendarAllDay => 'Guyyaa guutuu';

  @override
  String get calendarCreate => 'Uumi';

  @override
  String get calendarUpdate => 'Haaromsi';

  @override
  String get calendarNoEventsForDay => 'Guyyaa kanaaf gochi hin jiru';

  @override
  String get actionEdit => 'Gulaali';

  @override
  String get actionDelete => 'Haqi';

  @override
  String get actionCancel => 'Dhiisi';

  @override
  String get deleteEventConfirmTitle => 'Gocha Haqi';

  @override
  String deleteEventConfirmBody(Object title) {
    return '\"$title\" haquu ni mirkaneessita?';
  }

  @override
  String get eventSaveError => 'Gocha olkaayuun hin milkaa\'in';

  @override
  String get editEventTitle => 'Gocha Gulaali';

  @override
  String get newEventTitle => 'Gocha Haaraa';

  @override
  String get fieldTitle => 'Mata duree';

  @override
  String get fieldTitleRequired => 'Mata dureen barbaachisaadha';

  @override
  String get fieldLocationOptional => 'Iddoo (ni danda\'ama)';

  @override
  String get fieldCategoryOptional => 'Ramaddii (ni danda\'ama)';

  @override
  String get fieldDescriptionOptional => 'Ibsa (ni danda\'ama)';

  @override
  String get categoryNone => 'Homaa';

  @override
  String get categoryMeeting => 'Walga\'ii';

  @override
  String get categoryPersonal => 'Dhuunfaa';

  @override
  String get categoryDeadline => 'Yeroo dhumaa';

  @override
  String get categoryHealth => 'Fayyaa';

  @override
  String get categoryOther => 'Kan biraa';

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
      other: 'Gochaawwan $count',
      one: 'Gocha 1',
    );
    return '$_temp0';
  }

  @override
  String get jumpToDateTitle => 'Gara guyyaatti darbi';

  @override
  String get jumpToDateHint => 'Guyyaa filadhu';

  @override
  String get actionGo => 'Deemi';

  @override
  String get actionSave => 'Olkaa\'i';

  @override
  String get filterDay => 'Guyyaa';

  @override
  String get filterWeek => 'Torban';

  @override
  String get filterMonth => 'Ji\'a';

  @override
  String get filterAll => 'Hunda';

  @override
  String get calendarAllEvents => 'Gochaawwan Hunda';

  @override
  String get settingsCalendar => 'Kaalandara';

  @override
  String get settingsPrimaryCalendar => 'Kaalandara Dursaa';

  @override
  String get settingsPrimaryCalendarEthiopian => 'Itoophiyaa';

  @override
  String get settingsPrimaryCalendarGregorian => 'Greegoriyaan';

  @override
  String get settingsPrimaryCalendarDual => 'Lamaan';

  @override
  String get settingsWeekStart => 'Jalqaba Torbanii';

  @override
  String get settingsWeekStartSaturday => 'Sanbata';

  @override
  String get settingsWeekStartSunday => 'Dilbata';

  @override
  String get settingsWeekStartMonday => 'Wixata';

  @override
  String get settingsNumeralStyle => 'Bifa Lakkoofsaa';

  @override
  String get settingsNumeralGez => 'Gi\'izii';

  @override
  String get settingsNumeralLatin => 'Laatiinii';

  @override
  String get settingsTimezone => 'Naannoo Yeroo';

  @override
  String get settingsTimezoneAddisAbaba => 'Finfinnee';

  @override
  String get settingsTimezoneGMT => 'GMT';

  @override
  String get onboardingLanguageTitle => 'Afaan kee filadhu';

  @override
  String get onboardingLanguageBody =>
      'Afaan filadhu. Kanii booda Qindaa\'ina irraa jijjiiruu dandeessa.';

  @override
  String get onboardingIntroBody =>
      'Pilaanera dhuunfaa Kaalandara Itoophiyaa fi Greegoriyaan, yaadachiiftota fi barruuwwan qabu. Deetaan kee meeshaa kee irratti hafa.';

  @override
  String get onboardingGetStarted => 'Jalqabi';

  @override
  String get onboardingAccountTitle => 'Karoora itti fufi';

  @override
  String get onboardingAccountBody =>
      'Deetaa kee olkaayuuf herrega uumi, ykn akka keessummaatti itti fufi.';

  @override
  String get onboardingContinueGuest => 'Akka keessummaatti itti fufi';

  @override
  String get onboardingCreateAccount => 'Herrega Uumi';

  @override
  String get onboardingSignIn => 'Herrega qabdaa? Seeni';

  @override
  String get onboardingGuestTitle => 'Deetaan kee asuma hafa';

  @override
  String get onboardingGuestBody =>
      'Deetaan keessummaa meeshaa kana irratti qofa hafa. Hin olkaayamu, kanaaf yoo appii haquun baduu danda\'a. Booda herrega uumun deetaa kee galchuu dandeessa.';

  @override
  String get onboardingGotIt => 'Hubadheera';

  @override
  String get recurrenceTitle => 'Bifa Irra Deebii';

  @override
  String get recurrenceFrequency => 'Irra Deebii';

  @override
  String get recurrenceFreqDaily => 'Guyyaa Guyyaan';

  @override
  String get recurrenceFreqWeekly => 'Torban Torbaniin';

  @override
  String get recurrenceFreqMonthly => 'Ji\'a Ji\'aan';

  @override
  String get recurrenceFreqYearly => 'Waggaa Waggaan';

  @override
  String get recurrenceInterval => 'Hundatti irra deebi\'i';

  @override
  String get recurrenceDay => 'guyyaa';

  @override
  String get recurrenceDays => 'guyyaa';

  @override
  String get recurrenceWeek => 'torban';

  @override
  String get recurrenceWeeks => 'torban';

  @override
  String get recurrenceMonth => 'ji\'a';

  @override
  String get recurrenceMonths => 'ji\'a';

  @override
  String get recurrenceYear => 'waggaa';

  @override
  String get recurrenceYears => 'waggaa';

  @override
  String get recurrenceCalendarBasis => 'Bu\'uura Kaalandaraa';

  @override
  String get calendarBasisEthiopian => 'Itoophiyaa';

  @override
  String get calendarBasisGregorian => 'Greegoriyaan';

  @override
  String get recurrenceEnd => 'Dhumata';

  @override
  String get recurrenceEndNever => 'Tasuma';

  @override
  String get recurrenceEndAfter => 'Booda';

  @override
  String get recurrenceOccurrences => 'irra deebii';

  @override
  String get recurrenceEndOnDate => 'Guyyaa irratti';

  @override
  String get recurrencePreview => 'Dursee Arga';

  @override
  String get recurrenceNone => 'Irra deebii hin qabu';

  @override
  String get recurrenceClear => 'Irra deebii dhiisi';

  @override
  String get settingsContentPacks => 'Paakkota Qabiyyee';

  @override
  String get settingsEthiopianHolidays => 'Ayyaana Itoophiyaa';

  @override
  String get settingsEthiopianObservances => 'Guyyoota Yaadannoo Itoophiyaa';

  @override
  String get settingsEnabled => 'Dandeessifame';

  @override
  String get settingsDisabled => 'Dhowwame';

  @override
  String get editOccurrenceTitle => 'Gocha Irra Deebii Gulaali';

  @override
  String get editOccurrenceMessage =>
      'Kan har\'aa qofa gulaaluu barbaadda moo hunda?';

  @override
  String get editThisOccurrence => 'Kan Har\'aa Qofa';

  @override
  String get editAllOccurrences => 'Hunda';

  @override
  String get deleteOccurrenceTitle => 'Gocha Irra Deebii Haqi';

  @override
  String get deleteOccurrenceMessage =>
      'Kan har\'aa qofa haquu barbaadda moo hunda?';

  @override
  String get deleteThisOccurrence => 'Kan Har\'aa Qofa';

  @override
  String get deleteAllOccurrences => 'Hunda';

  @override
  String get snoozeReminder => 'Yaadachiiftuu Tursiisi';

  @override
  String get snooze15Minutes => 'Daqiiqaa 15';

  @override
  String get snooze30Minutes => 'Daqiiqaa 30';

  @override
  String get snooze1Hour => 'Sa\'aa 1';

  @override
  String get snooze2Hours => 'Sa\'aa 2';

  @override
  String get snoozeTomorrow => 'Hanga boruutti tursiisi (Sa\'a 3)';

  @override
  String get skipOccurrence => 'Utali';

  @override
  String get skipConfirmation => 'Gochi kun ni utaalama. Kan biraa hin tuqamu.';

  @override
  String get linkToEvent => 'Gocha Quunamsiisi';

  @override
  String get linkToReminder => 'Yaadachiiftuu Quunamsiisi';

  @override
  String get linkToPlanner => 'Pilaanera Quunamsiisi';

  @override
  String get noItemsToLink =>
      'Wanti quunamsiisuuf jiru hin jiru. Jalqaba uumi.';

  @override
  String get reminderSnooze => 'Tursiisi';

  @override
  String get reminderSkip => 'Utali';

  @override
  String get reminderCancel => 'Yaadachiiftuu Haqi';

  @override
  String get plannerDay => 'Guyyaa';

  @override
  String get plannerWeek => 'Torban';

  @override
  String get plannerMonth => 'Ji\'a';

  @override
  String get plannerYear => 'Waggaa';

  @override
  String get plannerSectionFocus => 'Xiyyeeffannoo';

  @override
  String get plannerSectionPriorities => 'Dursa';

  @override
  String get plannerSectionChecklist => 'Tarree Mirkaneessaa';

  @override
  String get plannerSectionNotes => 'Barruuwwan';

  @override
  String get plannerSectionReflection => 'Yaadannoo';

  @override
  String get plannerSectionFocusEmpty => 'Xiyyeeffannoo kee har\'aa maali?';

  @override
  String get plannerSectionPrioritiesEmpty => 'Dursa kee ida\'i';

  @override
  String get plannerSectionChecklistEmpty => 'Hojiiwwan raawwataman ida\'i';

  @override
  String get plannerSectionNotesEmpty => 'Barruuwwan yeroo kanaa ida\'i';

  @override
  String get plannerSectionReflectionEmpty =>
      'Adeemsa kee irratti yaadannoo taasisi';

  @override
  String get copyFromPreviousTitle => 'Kan Duraa Irraa Garagalchi';

  @override
  String copyFromPreviousMessage(Object period) {
    return 'Hunda $period duraa irraa garagalchuu? Kan jiran ni utaalama.';
  }

  @override
  String get carryForwardTitle => 'Gara Fuulduraatti Darbi';

  @override
  String carryForwardMessage(Object period) {
    return 'Hojiiwwan hin raawwatamin $period duraa irraa darbii? Kan jiran ni utaalama.';
  }

  @override
  String copiedItems(Object count) {
    return '$count garagalchameera';
  }

  @override
  String carriedItems(Object count) {
    return '$count gara fuulduraatti darbeera';
  }

  @override
  String get nothingToCopy =>
      'Kan duraa irraa garagalchuuf wanti jiru hin jiru';

  @override
  String get nothingToCarry => 'Hojiiwwan hin raawwatamin darban hin jiru';

  @override
  String get recentlyDeletedConfirmTitle => 'Guutummaatti haquu?';

  @override
  String recentlyDeletedConfirmBody(Object title) {
    return '\"$title\" guutummaatti ni haqama. Kuni hin deebi\'u.';
  }

  @override
  String get recentlyDeletedFilterAll => 'Hunda';

  @override
  String get recentlyDeletedFilterEvents => 'Gochaawwan';

  @override
  String get recentlyDeletedFilterReminders => 'Yaadachiiftota';

  @override
  String get recentlyDeletedFilterPlanner => 'Pilaanera';

  @override
  String get recentlyDeletedFilterNotes => 'Barruuwwan';

  @override
  String recentlyDeletedDeletedOn(Object date) {
    return 'Guyyaa haqame $date';
  }

  @override
  String get revisionHistory => 'Seenaa Fooyya\'insaa';

  @override
  String get restoreRevisionTitle => 'Veshinii kana deebisuu?';

  @override
  String get restoreRevisionBody =>
      'Kuni qabiyyee barruu amma jiru veshinii kanaan bakka buusa.';

  @override
  String get revisionRestored => 'Veshiniin deebifameera';

  @override
  String get notificationPermissionTitle => 'Eeyyama Beeksisaa';

  @override
  String get notificationPermissionBody =>
      'Yaadachiiftota yeroon argachuuf beeksisa eeyyami.';

  @override
  String get notificationPermissionOK => 'Tole';

  @override
  String get plannerManageSections => 'Kutaawwan bulchi';

  @override
  String get searchCategoryHint => 'Ramaddii';

  @override
  String get syncTitle => 'Deetaan Walsimsiisi';

  @override
  String get syncClose => 'Cufi';

  @override
  String get syncImportGuest => 'Deetaa Keessummaa Galchi';

  @override
  String get syncNow => 'Amma Walsimsiisi';

  @override
  String get syncReady => 'Walsimsiisuuf qophiidha';

  @override
  String get syncComplete => 'Walsimsiisuun xumurameera';

  @override
  String get syncConflicts => 'Walitti bu\'iinsi argameera';

  @override
  String get delete => 'Haqi';

  @override
  String get deleteNoteConfirmTitle => 'Barruu haquu?';

  @override
  String deleteNoteConfirmBody(Object title) {
    return '\"$title\" guutummaatti ni haqama.';
  }

  @override
  String get deleteNoteConfirmDelete => 'Haqi';

  @override
  String get searchAcrossData => 'Deetaa kee hunda barbaadi';

  @override
  String get searchNoResults => 'Bu\'aan hin argamne';

  @override
  String get searchTryDifferent => 'Jecha biraa yaali';

  @override
  String searchResultsCount(Object count) {
    return 'Bu\'aa $count';
  }

  @override
  String get searchFilterTypes => 'Gosaan fili';

  @override
  String get searchFilterDateRange => 'Yeroo guyyaa';

  @override
  String get searchFilterCategory => 'Ramaddii';

  @override
  String get searchClearFilters => 'Hunda dhiisi';

  @override
  String get searchAll => 'Hunda';

  @override
  String get searchCategoryWork => 'Hojii';

  @override
  String get searchCategoryPersonal => 'Dhuunfaa';

  @override
  String get searchCategoryOther => 'Kan biraa';

  @override
  String get searchTypeEvents => 'Gochaawwan';

  @override
  String get searchTypeReminders => 'Yaadachiiftota';

  @override
  String get searchTypePlanner => 'Pilaanera';

  @override
  String get searchTypeNotes => 'Barruuwwan';

  @override
  String get recentlyDeletedTab => 'Dhiheenya Kan Haqame';

  @override
  String get pin => 'Kabsaali';

  @override
  String get unpin => 'Hiiki';

  @override
  String get archive => 'Kuusi';

  @override
  String get unarchive => 'Baasi';

  @override
  String get viewHistory => 'Seenaa Ilaali';

  @override
  String get plannerItem => 'Qabiyyee Pilaaneraa';

  @override
  String get plannerGoToToday => 'Har\'a Argi';

  @override
  String get healthCategory => 'Fayyaa';

  @override
  String get onboardingSystemLanguage => 'Sirna';

  @override
  String get navigationPrevious => 'Duraa';

  @override
  String get navigationNext => 'Itti Aanu';

  @override
  String get currentPeriod => 'Amma';

  @override
  String get add => 'Ida\'i';

  @override
  String get clearSearch => 'Barbaacha dhiisi';

  @override
  String get expandFilters => 'Bal\'isi';

  @override
  String get collapseFilters => 'Qunqii';

  @override
  String get dateConverterTitle => 'Guyyaa Jijjiiruu';

  @override
  String get dateConverterSwap => 'Kallattii jijjiiri';

  @override
  String get dateConverterEthiopianDate => 'Guyyaa Itoophiyaa';

  @override
  String get dateConverterGregorianDate => 'Guyyaa Greegoriyaan';

  @override
  String get dateConverterYear => 'Waggaa';

  @override
  String get dateConverterMonth => 'Ji\'a';

  @override
  String get dateConverterDay => 'Guyyaa';

  @override
  String get dateConverterConvert => 'Jijjiiri';

  @override
  String get dateConverterResult => 'Bu\'aa';

  @override
  String get moreDateConverter => 'Guyyaa Jijjiiruu';

  @override
  String get dailyQuoteTitle => 'Kaka\'umsa Har\'aa';

  @override
  String get sectionNotes => 'Barruuwwan';

  @override
  String notesMoreCount(int count) {
    return 'Barruuwwan dabalataa +$count';
  }

  @override
  String get complete => 'Xumurame';

  @override
  String get snoozeOneHour => 'Sa\'a 1f tursiisi';

  @override
  String get tapToView => 'Bal\'inaan ilaaluuf tuqi';

  @override
  String planningStreakTooltip(int count) {
    return 'Guyyaa $count karoora walitti fufinsaan';
  }

  @override
  String quickAddLastUsed(String type) {
    return 'Dhumarratti kan fayyadame: $type';
  }

  @override
  String get eventTypeMeeting => 'Walga\'ii';

  @override
  String get eventTypePersonal => 'Dhuunfaa';

  @override
  String get eventTypeDeadline => 'Yeroo dhumaa';

  @override
  String get eventTypeHealth => 'Fayyaa';

  @override
  String get eventTypeOther => 'Kan biraa';

  @override
  String get settingsNotificationSound => 'Sagalee Beeksisaa';

  @override
  String get notificationSoundSystem => 'Sirna';

  @override
  String get notificationSoundSystemDesc =>
      'Sagalee beeksisaa meeshaa kee fayyadami';

  @override
  String get notificationSoundEthiopianBell => 'Bilbila Itoophiyaa';

  @override
  String get notificationSoundGentleChime => 'Sagalee Lallaafaa';

  @override
  String get notificationSoundSoftPing => 'Ping Lallaafaa';

  @override
  String get notificationSoundWarmTone => 'Toonii Ho\'aa';

  @override
  String get notificationSoundCustomDesc => 'Sagalee beeksisaa dhuunfaa';
}
