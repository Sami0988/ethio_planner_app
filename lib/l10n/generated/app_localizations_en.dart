// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Walia Planner';

  @override
  String get todayTab => 'Today';

  @override
  String get calendarTab => 'Calendar';

  @override
  String get plannerTab => 'Planner';

  @override
  String get moreTab => 'More';

  @override
  String get searchLabel => 'Search';

  @override
  String get accountLabel => 'Account';

  @override
  String get sectionUpNext => 'Up Next';

  @override
  String get sectionEvents => 'Events';

  @override
  String get sectionReminders => 'Reminders';

  @override
  String get sectionTodaySchedule => 'Today\'s Schedule';

  @override
  String get seeAll => 'See all';

  @override
  String get quickAddTitle => 'Quick Add';

  @override
  String get quickAddEvent => 'Event';

  @override
  String get quickAddReminder => 'Reminder';

  @override
  String get quickAddNote => 'Note';

  @override
  String get reminderOverdue => 'Overdue';

  @override
  String get allDay => 'All-day';

  @override
  String get ecSuffix => 'EC';

  @override
  String get gcSuffix => 'GC';

  @override
  String get emptyTodayTitle => 'A calm, fresh day';

  @override
  String get emptyTodayBody =>
      'You have nothing scheduled today. Add an event, reminder or note when you are ready.';

  @override
  String get addSomething => 'Add something';

  @override
  String get syncOffline => 'Offline';

  @override
  String get syncSavedLocally => 'Saved locally';

  @override
  String get syncWaitingToSync => 'Waiting to sync';

  @override
  String get syncSyncing => 'Syncing…';

  @override
  String get syncingLabel => 'Syncing…';

  @override
  String get syncSynced => 'Synced';

  @override
  String get syncFailed => 'Sync failed';

  @override
  String get syncRetry => 'Retry';

  @override
  String get syncRejected => 'Rejected';

  @override
  String get syncConflict => 'Conflict detected';

  @override
  String get syncReview => 'Review';

  @override
  String get syncActionRequired => 'Action required';

  @override
  String syncWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count changes waiting to sync',
      one: '1 change waiting to sync',
    );
    return '$_temp0';
  }

  @override
  String get moreReminders => 'Reminders';

  @override
  String get moreNotes => 'Notes';

  @override
  String get moreSettings => 'Settings';

  @override
  String get moreRecentlyDeleted => 'Recently Deleted';

  @override
  String get settingsTheme => 'Theme';

  @override
  String get settingsThemeSystem => 'System';

  @override
  String get settingsThemeLight => 'Light';

  @override
  String get settingsThemeDark => 'Dark';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get settingsLanguageSystem => 'System';

  @override
  String get settingsLanguageEnglish => 'English';

  @override
  String get settingsLanguageAmharic => 'Amharic';

  @override
  String get settingsLanguageOromoo => 'Afaan Oromoo';

  @override
  String get settingsLanguageTigrinya => 'Tigrinya';

  @override
  String get settingsVersion => 'Version';

  @override
  String get authSignIn => 'Sign In';

  @override
  String get authSignUp => 'Sign Up';

  @override
  String get authEmail => 'Email';

  @override
  String get authPassword => 'Password';

  @override
  String get authConfirmPassword => 'Confirm Password';

  @override
  String get authName => 'Name';

  @override
  String get authForgotPassword => 'Forgot password?';

  @override
  String get authNoAccount => 'Don\'t have an account?';

  @override
  String get authHasAccount => 'Already have an account?';

  @override
  String get authVerifyEmail => 'Verify Email';

  @override
  String get authVerificationCode => 'Verification Code';

  @override
  String get authResetPassword => 'Reset Password';

  @override
  String get authSendCode => 'Send Code';

  @override
  String get authResetCodeSent => 'Reset code sent';

  @override
  String get recentlyDeletedTitle => 'Recently Deleted';

  @override
  String get recentlyDeletedEmpty => 'No recently deleted items';

  @override
  String get recentlyDeletedHint =>
      'Deleted items will appear here for 30 days';

  @override
  String get recentlyDeletedRestore => 'Restore';

  @override
  String get recentlyDeletedDelete => 'Delete';

  @override
  String recentlyDeletedDaysLeft(int count) {
    return '$count days until permanent deletion';
  }

  @override
  String get conflictCenterTitle => 'Conflict Center';

  @override
  String get conflictCenterEmpty => 'No conflicts';

  @override
  String get conflictCenterSynced => 'All your data is in sync';

  @override
  String get conflictKeepLocal => 'Keep local version';

  @override
  String get conflictKeepRemote => 'Keep remote version';

  @override
  String get conflictKeepBoth => 'Keep both versions';

  @override
  String get conflictResolve => 'Resolve';

  @override
  String get notesTitle => 'Notes';

  @override
  String get notesEmpty => 'No notes';

  @override
  String get notesHint => 'Tap + to create a note';

  @override
  String get notesPinned => 'Pinned';

  @override
  String get notesArchived => 'Archived';

  @override
  String get searchEmpty => 'No results found';

  @override
  String get searchHint => 'Find events, reminders, planner items, and notes';

  @override
  String get searchPlaceholder => 'Search events, reminders, notes...';

  @override
  String searchResults(Object count) {
    return '$count results';
  }

  @override
  String get plannerFocus => 'Focus';

  @override
  String get plannerPriorities => 'Priorities';

  @override
  String get plannerChecklist => 'Checklist';

  @override
  String get plannerNotes => 'Notes';

  @override
  String get plannerReflection => 'Reflection';

  @override
  String get plannerNoItems => 'No items';

  @override
  String get calendarNoEvents => 'No events for this day';

  @override
  String get calendarNewEvent => 'New Event';

  @override
  String get calendarEditEvent => 'Edit Event';

  @override
  String get calendarNewReminder => 'New Reminder';

  @override
  String get calendarEditReminder => 'Edit Reminder';

  @override
  String get calendarTitle => 'Title';

  @override
  String get calendarLocation => 'Location (optional)';

  @override
  String get calendarCategory => 'Category (optional)';

  @override
  String get calendarDescription => 'Description (optional)';

  @override
  String get calendarAllDay => 'All day';

  @override
  String get calendarCreate => 'Create';

  @override
  String get calendarUpdate => 'Update';

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
  String get categoryMeeting => 'Meeting';

  @override
  String get categoryPersonal => 'Personal';

  @override
  String get categoryDeadline => 'Deadline';

  @override
  String get categoryHealth => 'Health';

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
  String get actionSave => 'Save';

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

  @override
  String get settingsCalendar => 'Calendar';

  @override
  String get settingsPrimaryCalendar => 'Primary Calendar';

  @override
  String get settingsPrimaryCalendarEthiopian => 'Ethiopian';

  @override
  String get settingsPrimaryCalendarGregorian => 'Gregorian';

  @override
  String get settingsPrimaryCalendarDual => 'Dual';

  @override
  String get settingsWeekStart => 'Week Start';

  @override
  String get settingsWeekStartSaturday => 'Saturday';

  @override
  String get settingsWeekStartSunday => 'Sunday';

  @override
  String get settingsWeekStartMonday => 'Monday';

  @override
  String get settingsNumeralStyle => 'Numeral Style';

  @override
  String get settingsNumeralGez => 'Ge\'ez';

  @override
  String get settingsNumeralLatin => 'Latin';

  @override
  String get settingsTimezone => 'Timezone';

  @override
  String get settingsTimezoneAddisAbaba => 'Addis Ababa';

  @override
  String get settingsTimezoneGMT => 'GMT';

  @override
  String get onboardingLanguageTitle => 'Choose your language';

  @override
  String get onboardingLanguageBody =>
      'Select your preferred language. You can change this later in Settings.';

  @override
  String get onboardingIntroBody =>
      'A personal planner with dual Ethiopian and Gregorian calendars, offline reminders and notes. Your data stays on your device.';

  @override
  String get onboardingGetStarted => 'Get Started';

  @override
  String get onboardingAccountTitle => 'Continue planning';

  @override
  String get onboardingAccountBody =>
      'Create an account to back up your data and sync across devices, or continue as a guest.';

  @override
  String get onboardingContinueGuest => 'Continue as Guest';

  @override
  String get onboardingCreateAccount => 'Create Account';

  @override
  String get onboardingSignIn => 'Already have an account? Sign in';

  @override
  String get onboardingGuestTitle => 'Your data stays here';

  @override
  String get onboardingGuestBody =>
      'Guest data is stored only on this device. It is not backed up and may be lost if you uninstall the app. You can import your data after creating an account later.';

  @override
  String get onboardingGotIt => 'Got it';

  @override
  String get recurrenceTitle => 'Repeat Pattern';

  @override
  String get recurrenceFrequency => 'Frequency';

  @override
  String get recurrenceFreqDaily => 'Daily';

  @override
  String get recurrenceFreqWeekly => 'Weekly';

  @override
  String get recurrenceFreqMonthly => 'Monthly';

  @override
  String get recurrenceFreqYearly => 'Yearly';

  @override
  String get recurrenceInterval => 'Repeat every';

  @override
  String get recurrenceDay => 'day';

  @override
  String get recurrenceDays => 'days';

  @override
  String get recurrenceWeek => 'week';

  @override
  String get recurrenceWeeks => 'weeks';

  @override
  String get recurrenceMonth => 'month';

  @override
  String get recurrenceMonths => 'months';

  @override
  String get recurrenceYear => 'year';

  @override
  String get recurrenceYears => 'years';

  @override
  String get recurrenceCalendarBasis => 'Calendar basis';

  @override
  String get calendarBasisEthiopian => 'Ethiopian';

  @override
  String get calendarBasisGregorian => 'Gregorian';

  @override
  String get recurrenceEnd => 'Ends';

  @override
  String get recurrenceEndNever => 'Never';

  @override
  String get recurrenceEndAfter => 'After';

  @override
  String get recurrenceOccurrences => 'occurrences';

  @override
  String get recurrenceEndOnDate => 'On date';

  @override
  String get recurrencePreview => 'Preview';

  @override
  String get recurrenceNone => 'No repeat';

  @override
  String get recurrenceClear => 'Remove repeat';

  @override
  String get settingsContentPacks => 'Content Packs';

  @override
  String get settingsEthiopianHolidays => 'Ethiopian Holidays';

  @override
  String get settingsEthiopianObservances => 'Ethiopian Observances';

  @override
  String get settingsEnabled => 'Enabled';

  @override
  String get settingsDisabled => 'Disabled';

  @override
  String get editOccurrenceTitle => 'Edit Recurring Event';

  @override
  String get editOccurrenceMessage =>
      'Do you want to edit only this occurrence, or all occurrences in the series?';

  @override
  String get editThisOccurrence => 'This Occurrence';

  @override
  String get editAllOccurrences => 'All Occurrences';

  @override
  String get deleteOccurrenceTitle => 'Delete Recurring Event';

  @override
  String get deleteOccurrenceMessage =>
      'Do you want to delete only this occurrence, or all occurrences in the series?';

  @override
  String get deleteThisOccurrence => 'This Occurrence';

  @override
  String get deleteAllOccurrences => 'All Occurrences';

  @override
  String get snoozeReminder => 'Snooze Reminder';

  @override
  String get snooze15Minutes => '15 minutes';

  @override
  String get snooze30Minutes => '30 minutes';

  @override
  String get snooze1Hour => '1 hour';

  @override
  String get snooze2Hours => '2 hours';

  @override
  String get snoozeTomorrow => 'Snooze until tomorrow (9 AM)';

  @override
  String get skipOccurrence => 'Skip';

  @override
  String get skipConfirmation =>
      'This occurrence will be skipped. Other occurrences in the series are not affected.';

  @override
  String get linkToEvent => 'Link Event';

  @override
  String get linkToReminder => 'Link Reminder';

  @override
  String get linkToPlanner => 'Link Planner';

  @override
  String get noItemsToLink => 'No items available to link. Create some first.';

  @override
  String get reminderSnooze => 'Snooze';

  @override
  String get reminderSkip => 'Skip';

  @override
  String get reminderCancel => 'Cancel Reminder';

  @override
  String get plannerDay => 'Day';

  @override
  String get plannerWeek => 'Week';

  @override
  String get plannerMonth => 'Month';

  @override
  String get plannerYear => 'Year';

  @override
  String get plannerSectionFocus => 'Focus';

  @override
  String get plannerSectionPriorities => 'Priorities';

  @override
  String get plannerSectionChecklist => 'Checklist';

  @override
  String get plannerSectionNotes => 'Notes';

  @override
  String get plannerSectionReflection => 'Reflection';

  @override
  String get plannerSectionFocusEmpty => 'What\'s your main focus today?';

  @override
  String get plannerSectionPrioritiesEmpty => 'Add your top priorities';

  @override
  String get plannerSectionChecklistEmpty => 'Add tasks to check off';

  @override
  String get plannerSectionNotesEmpty => 'Add notes for this period';

  @override
  String get plannerSectionReflectionEmpty => 'Reflect on your progress';

  @override
  String get copyFromPreviousTitle => 'Copy from Previous';

  @override
  String copyFromPreviousMessage(Object period) {
    return 'Copy all items from the previous $period to today? Duplicates will be skipped.';
  }

  @override
  String get carryForwardTitle => 'Carry Forward';

  @override
  String carryForwardMessage(Object period) {
    return 'Carry forward incomplete items from the previous $period? Duplicates will be skipped.';
  }

  @override
  String copiedItems(Object count) {
    return '$count item(s) copied';
  }

  @override
  String carriedItems(Object count) {
    return '$count item(s) carried forward';
  }

  @override
  String get nothingToCopy => 'Nothing to copy from the previous period';

  @override
  String get nothingToCarry => 'No incomplete items to carry forward';

  @override
  String get recentlyDeletedConfirmTitle => 'Permanently delete?';

  @override
  String recentlyDeletedConfirmBody(Object title) {
    return '\"$title\" will be permanently deleted. This cannot be undone.';
  }

  @override
  String get recentlyDeletedFilterAll => 'All';

  @override
  String get recentlyDeletedFilterEvents => 'Events';

  @override
  String get recentlyDeletedFilterReminders => 'Reminders';

  @override
  String get recentlyDeletedFilterPlanner => 'Planner';

  @override
  String get recentlyDeletedFilterNotes => 'Notes';

  @override
  String recentlyDeletedDeletedOn(Object date) {
    return 'Deleted $date';
  }

  @override
  String get revisionHistory => 'Revision History';

  @override
  String get restoreRevisionTitle => 'Restore this version?';

  @override
  String get restoreRevisionBody =>
      'This will replace the current note content with this version.';

  @override
  String get revisionRestored => 'Revision restored';

  @override
  String get notificationPermissionTitle => 'Notification Permission';

  @override
  String get notificationPermissionBody =>
      'Allow notifications to receive reminders on time.';

  @override
  String get notificationPermissionOK => 'OK';

  @override
  String get plannerManageSections => 'Manage sections';

  @override
  String get searchCategoryHint => 'Category';

  @override
  String get syncTitle => 'Sync Data';

  @override
  String get syncClose => 'Close';

  @override
  String get syncImportGuest => 'Import Guest Data';

  @override
  String get syncNow => 'Sync Now';

  @override
  String get syncReady => 'Ready to sync';

  @override
  String get syncComplete => 'Sync complete';

  @override
  String get syncConflicts => 'Conflicts detected';

  @override
  String get delete => 'Delete';

  @override
  String get deleteNoteConfirmTitle => 'Delete note?';

  @override
  String deleteNoteConfirmBody(Object title) {
    return '\"$title\" will be permanently deleted.';
  }

  @override
  String get deleteNoteConfirmDelete => 'Delete';

  @override
  String get searchAcrossData => 'Search across your data';

  @override
  String get searchNoResults => 'No results found';

  @override
  String get searchTryDifferent => 'Try a different search term';

  @override
  String searchResultsCount(Object count) {
    return '$count results';
  }

  @override
  String get searchFilterTypes => 'Filter by type';

  @override
  String get searchFilterDateRange => 'Date range';

  @override
  String get searchFilterCategory => 'Category';

  @override
  String get searchClearFilters => 'Clear filters';

  @override
  String get searchAll => 'All';

  @override
  String get searchCategoryWork => 'Work';

  @override
  String get searchCategoryPersonal => 'Personal';

  @override
  String get searchCategoryOther => 'Other';

  @override
  String get searchTypeEvents => 'Events';

  @override
  String get searchTypeReminders => 'Reminders';

  @override
  String get searchTypePlanner => 'Planner';

  @override
  String get searchTypeNotes => 'Notes';

  @override
  String get recentlyDeletedTab => 'Recently Deleted';

  @override
  String get pin => 'Pin';

  @override
  String get unpin => 'Unpin';

  @override
  String get archive => 'Archive';

  @override
  String get unarchive => 'Unarchive';

  @override
  String get viewHistory => 'View History';

  @override
  String get plannerItem => 'Planner Item';

  @override
  String get plannerGoToToday => 'Go to today';

  @override
  String get healthCategory => 'Health';

  @override
  String get onboardingSystemLanguage => 'System';

  @override
  String get navigationPrevious => 'Previous';

  @override
  String get navigationNext => 'Next';

  @override
  String get currentPeriod => 'Current';

  @override
  String get add => 'Add';

  @override
  String get clearSearch => 'Clear search';

  @override
  String get expandFilters => 'Expand filters';

  @override
  String get collapseFilters => 'Collapse filters';

  @override
  String get dateConverterTitle => 'Date Converter';

  @override
  String get dateConverterSwap => 'Swap direction';

  @override
  String get dateConverterEthiopianDate => 'Ethiopian Date';

  @override
  String get dateConverterGregorianDate => 'Gregorian Date';

  @override
  String get dateConverterYear => 'Year';

  @override
  String get dateConverterMonth => 'Month';

  @override
  String get dateConverterDay => 'Day';

  @override
  String get dateConverterConvert => 'Convert';

  @override
  String get dateConverterResult => 'Result';

  @override
  String get moreDateConverter => 'Date Converter';

  @override
  String get dailyQuoteTitle => 'Daily Inspiration';

  @override
  String get sectionNotes => 'Notes';

  @override
  String notesMoreCount(int count) {
    return '+$count more notes';
  }

  @override
  String get complete => 'Complete';

  @override
  String get snoozeOneHour => 'Snooze for 1 hour';

  @override
  String get tapToView => 'Tap to view details';

  @override
  String planningStreakTooltip(int count) {
    return '$count-day planning streak';
  }

  @override
  String quickAddLastUsed(String type) {
    return 'Last used: $type';
  }

  @override
  String get eventTypeMeeting => 'Meeting';

  @override
  String get eventTypePersonal => 'Personal';

  @override
  String get eventTypeDeadline => 'Deadline';

  @override
  String get eventTypeHealth => 'Health';

  @override
  String get eventTypeOther => 'Other';

  @override
  String get settingsNotificationSound => 'Notification Sound';

  @override
  String get notificationSoundSystem => 'System Default';

  @override
  String get notificationSoundSystemDesc =>
      'Use your device\'s default notification sound';

  @override
  String get notificationSoundEthiopianBell => 'Ethiopian Bell';

  @override
  String get notificationSoundGentleChime => 'Gentle Chime';

  @override
  String get notificationSoundSoftPing => 'Soft Ping';

  @override
  String get notificationSoundWarmTone => 'Warm Tone';

  @override
  String get notificationSoundCustomDesc => 'Custom notification sound';
}
