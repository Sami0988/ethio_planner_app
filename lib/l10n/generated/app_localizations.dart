import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_am.dart';
import 'app_localizations_en.dart';
import 'app_localizations_om.dart';
import 'app_localizations_ti.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('am'),
    Locale('en'),
    Locale('om'),
    Locale('ti'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Walia Planner'**
  String get appTitle;

  /// No description provided for @todayTab.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get todayTab;

  /// No description provided for @calendarTab.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get calendarTab;

  /// No description provided for @plannerTab.
  ///
  /// In en, this message translates to:
  /// **'Planner'**
  String get plannerTab;

  /// No description provided for @moreTab.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get moreTab;

  /// No description provided for @searchLabel.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get searchLabel;

  /// No description provided for @accountLabel.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get accountLabel;

  /// No description provided for @sectionUpNext.
  ///
  /// In en, this message translates to:
  /// **'Up Next'**
  String get sectionUpNext;

  /// No description provided for @sectionEvents.
  ///
  /// In en, this message translates to:
  /// **'Events'**
  String get sectionEvents;

  /// No description provided for @sectionReminders.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get sectionReminders;

  /// No description provided for @sectionTodaySchedule.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Schedule'**
  String get sectionTodaySchedule;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get seeAll;

  /// No description provided for @quickAddTitle.
  ///
  /// In en, this message translates to:
  /// **'Quick Add'**
  String get quickAddTitle;

  /// No description provided for @quickAddEvent.
  ///
  /// In en, this message translates to:
  /// **'Event'**
  String get quickAddEvent;

  /// No description provided for @quickAddReminder.
  ///
  /// In en, this message translates to:
  /// **'Reminder'**
  String get quickAddReminder;

  /// No description provided for @quickAddNote.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get quickAddNote;

  /// No description provided for @reminderOverdue.
  ///
  /// In en, this message translates to:
  /// **'Overdue'**
  String get reminderOverdue;

  /// No description provided for @allDay.
  ///
  /// In en, this message translates to:
  /// **'All-day'**
  String get allDay;

  /// No description provided for @ecSuffix.
  ///
  /// In en, this message translates to:
  /// **'EC'**
  String get ecSuffix;

  /// No description provided for @gcSuffix.
  ///
  /// In en, this message translates to:
  /// **'GC'**
  String get gcSuffix;

  /// No description provided for @emptyTodayTitle.
  ///
  /// In en, this message translates to:
  /// **'A calm, fresh day'**
  String get emptyTodayTitle;

  /// No description provided for @emptyTodayBody.
  ///
  /// In en, this message translates to:
  /// **'You have nothing scheduled today. Add an event, reminder or note when you are ready.'**
  String get emptyTodayBody;

  /// No description provided for @addSomething.
  ///
  /// In en, this message translates to:
  /// **'Add something'**
  String get addSomething;

  /// No description provided for @syncOffline.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get syncOffline;

  /// No description provided for @syncSavedLocally.
  ///
  /// In en, this message translates to:
  /// **'Saved locally'**
  String get syncSavedLocally;

  /// No description provided for @syncWaitingToSync.
  ///
  /// In en, this message translates to:
  /// **'Waiting to sync'**
  String get syncWaitingToSync;

  /// No description provided for @syncSyncing.
  ///
  /// In en, this message translates to:
  /// **'Syncing…'**
  String get syncSyncing;

  /// No description provided for @syncingLabel.
  ///
  /// In en, this message translates to:
  /// **'Syncing…'**
  String get syncingLabel;

  /// No description provided for @syncSynced.
  ///
  /// In en, this message translates to:
  /// **'Synced'**
  String get syncSynced;

  /// No description provided for @syncFailed.
  ///
  /// In en, this message translates to:
  /// **'Sync failed'**
  String get syncFailed;

  /// No description provided for @syncRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get syncRetry;

  /// No description provided for @syncRejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get syncRejected;

  /// No description provided for @syncConflict.
  ///
  /// In en, this message translates to:
  /// **'Conflict detected'**
  String get syncConflict;

  /// No description provided for @syncReview.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get syncReview;

  /// No description provided for @syncActionRequired.
  ///
  /// In en, this message translates to:
  /// **'Action required'**
  String get syncActionRequired;

  /// No description provided for @syncWaiting.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 change waiting to sync} other{{count} changes waiting to sync}}'**
  String syncWaiting(int count);

  /// No description provided for @moreReminders.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get moreReminders;

  /// No description provided for @moreNotes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get moreNotes;

  /// No description provided for @moreSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get moreSettings;

  /// No description provided for @moreRecentlyDeleted.
  ///
  /// In en, this message translates to:
  /// **'Recently Deleted'**
  String get moreRecentlyDeleted;

  /// No description provided for @settingsTheme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get settingsTheme;

  /// No description provided for @settingsThemeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get settingsThemeSystem;

  /// No description provided for @settingsThemeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get settingsThemeLight;

  /// No description provided for @settingsThemeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get settingsThemeDark;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @settingsLanguageSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get settingsLanguageSystem;

  /// No description provided for @settingsLanguageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get settingsLanguageEnglish;

  /// No description provided for @settingsLanguageAmharic.
  ///
  /// In en, this message translates to:
  /// **'Amharic'**
  String get settingsLanguageAmharic;

  /// No description provided for @settingsLanguageOromoo.
  ///
  /// In en, this message translates to:
  /// **'Afaan Oromoo'**
  String get settingsLanguageOromoo;

  /// No description provided for @settingsLanguageTigrinya.
  ///
  /// In en, this message translates to:
  /// **'Tigrinya'**
  String get settingsLanguageTigrinya;

  /// No description provided for @settingsVersion.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get settingsVersion;

  /// No description provided for @authSignIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get authSignIn;

  /// No description provided for @authSignUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get authSignUp;

  /// No description provided for @authEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get authEmail;

  /// No description provided for @authPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get authPassword;

  /// No description provided for @authConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get authConfirmPassword;

  /// No description provided for @authName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get authName;

  /// No description provided for @authForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get authForgotPassword;

  /// No description provided for @authNoAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get authNoAccount;

  /// No description provided for @authHasAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get authHasAccount;

  /// No description provided for @authVerifyEmail.
  ///
  /// In en, this message translates to:
  /// **'Verify Email'**
  String get authVerifyEmail;

  /// No description provided for @authVerificationCode.
  ///
  /// In en, this message translates to:
  /// **'Verification Code'**
  String get authVerificationCode;

  /// No description provided for @authResetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get authResetPassword;

  /// No description provided for @authSendCode.
  ///
  /// In en, this message translates to:
  /// **'Send Code'**
  String get authSendCode;

  /// No description provided for @authResetCodeSent.
  ///
  /// In en, this message translates to:
  /// **'Reset code sent'**
  String get authResetCodeSent;

  /// No description provided for @recentlyDeletedTitle.
  ///
  /// In en, this message translates to:
  /// **'Recently Deleted'**
  String get recentlyDeletedTitle;

  /// No description provided for @recentlyDeletedEmpty.
  ///
  /// In en, this message translates to:
  /// **'No recently deleted items'**
  String get recentlyDeletedEmpty;

  /// No description provided for @recentlyDeletedHint.
  ///
  /// In en, this message translates to:
  /// **'Deleted items will appear here for 30 days'**
  String get recentlyDeletedHint;

  /// No description provided for @recentlyDeletedRestore.
  ///
  /// In en, this message translates to:
  /// **'Restore'**
  String get recentlyDeletedRestore;

  /// No description provided for @recentlyDeletedDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get recentlyDeletedDelete;

  /// No description provided for @recentlyDeletedDaysLeft.
  ///
  /// In en, this message translates to:
  /// **'{count} days until permanent deletion'**
  String recentlyDeletedDaysLeft(int count);

  /// No description provided for @conflictCenterTitle.
  ///
  /// In en, this message translates to:
  /// **'Conflict Center'**
  String get conflictCenterTitle;

  /// No description provided for @conflictCenterEmpty.
  ///
  /// In en, this message translates to:
  /// **'No conflicts'**
  String get conflictCenterEmpty;

  /// No description provided for @conflictCenterSynced.
  ///
  /// In en, this message translates to:
  /// **'All your data is in sync'**
  String get conflictCenterSynced;

  /// No description provided for @conflictKeepLocal.
  ///
  /// In en, this message translates to:
  /// **'Keep local version'**
  String get conflictKeepLocal;

  /// No description provided for @conflictKeepRemote.
  ///
  /// In en, this message translates to:
  /// **'Keep remote version'**
  String get conflictKeepRemote;

  /// No description provided for @conflictKeepBoth.
  ///
  /// In en, this message translates to:
  /// **'Keep both versions'**
  String get conflictKeepBoth;

  /// No description provided for @conflictResolve.
  ///
  /// In en, this message translates to:
  /// **'Resolve'**
  String get conflictResolve;

  /// No description provided for @notesTitle.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notesTitle;

  /// No description provided for @notesEmpty.
  ///
  /// In en, this message translates to:
  /// **'No notes'**
  String get notesEmpty;

  /// No description provided for @notesHint.
  ///
  /// In en, this message translates to:
  /// **'Tap + to create a note'**
  String get notesHint;

  /// No description provided for @notesPinned.
  ///
  /// In en, this message translates to:
  /// **'Pinned'**
  String get notesPinned;

  /// No description provided for @notesArchived.
  ///
  /// In en, this message translates to:
  /// **'Archived'**
  String get notesArchived;

  /// No description provided for @searchEmpty.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get searchEmpty;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Find events, reminders, planner items, and notes'**
  String get searchHint;

  /// No description provided for @searchPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Search events, reminders, notes...'**
  String get searchPlaceholder;

  /// No description provided for @searchResults.
  ///
  /// In en, this message translates to:
  /// **'{count} results'**
  String searchResults(Object count);

  /// No description provided for @plannerFocus.
  ///
  /// In en, this message translates to:
  /// **'Focus'**
  String get plannerFocus;

  /// No description provided for @plannerPriorities.
  ///
  /// In en, this message translates to:
  /// **'Priorities'**
  String get plannerPriorities;

  /// No description provided for @plannerChecklist.
  ///
  /// In en, this message translates to:
  /// **'Checklist'**
  String get plannerChecklist;

  /// No description provided for @plannerNotes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get plannerNotes;

  /// No description provided for @plannerReflection.
  ///
  /// In en, this message translates to:
  /// **'Reflection'**
  String get plannerReflection;

  /// No description provided for @plannerNoItems.
  ///
  /// In en, this message translates to:
  /// **'No items'**
  String get plannerNoItems;

  /// No description provided for @calendarNoEvents.
  ///
  /// In en, this message translates to:
  /// **'No events for this day'**
  String get calendarNoEvents;

  /// No description provided for @calendarNewEvent.
  ///
  /// In en, this message translates to:
  /// **'New Event'**
  String get calendarNewEvent;

  /// No description provided for @calendarEditEvent.
  ///
  /// In en, this message translates to:
  /// **'Edit Event'**
  String get calendarEditEvent;

  /// No description provided for @calendarNewReminder.
  ///
  /// In en, this message translates to:
  /// **'New Reminder'**
  String get calendarNewReminder;

  /// No description provided for @calendarEditReminder.
  ///
  /// In en, this message translates to:
  /// **'Edit Reminder'**
  String get calendarEditReminder;

  /// No description provided for @calendarTitle.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get calendarTitle;

  /// No description provided for @calendarLocation.
  ///
  /// In en, this message translates to:
  /// **'Location (optional)'**
  String get calendarLocation;

  /// No description provided for @calendarCategory.
  ///
  /// In en, this message translates to:
  /// **'Category (optional)'**
  String get calendarCategory;

  /// No description provided for @calendarDescription.
  ///
  /// In en, this message translates to:
  /// **'Description (optional)'**
  String get calendarDescription;

  /// No description provided for @calendarAllDay.
  ///
  /// In en, this message translates to:
  /// **'All day'**
  String get calendarAllDay;

  /// No description provided for @calendarCreate.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get calendarCreate;

  /// No description provided for @calendarUpdate.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get calendarUpdate;

  /// No description provided for @calendarNoEventsForDay.
  ///
  /// In en, this message translates to:
  /// **'No events for this day'**
  String get calendarNoEventsForDay;

  /// No description provided for @actionEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get actionEdit;

  /// No description provided for @actionDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get actionDelete;

  /// No description provided for @actionCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get actionCancel;

  /// No description provided for @deleteEventConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Event'**
  String get deleteEventConfirmTitle;

  /// No description provided for @deleteEventConfirmBody.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete \"{title}\"?'**
  String deleteEventConfirmBody(Object title);

  /// No description provided for @eventSaveError.
  ///
  /// In en, this message translates to:
  /// **'Failed to save event'**
  String get eventSaveError;

  /// No description provided for @editEventTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Event'**
  String get editEventTitle;

  /// No description provided for @newEventTitle.
  ///
  /// In en, this message translates to:
  /// **'New Event'**
  String get newEventTitle;

  /// No description provided for @fieldTitle.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get fieldTitle;

  /// No description provided for @fieldTitleRequired.
  ///
  /// In en, this message translates to:
  /// **'Title is required'**
  String get fieldTitleRequired;

  /// No description provided for @fieldLocationOptional.
  ///
  /// In en, this message translates to:
  /// **'Location (optional)'**
  String get fieldLocationOptional;

  /// No description provided for @fieldCategoryOptional.
  ///
  /// In en, this message translates to:
  /// **'Category (optional)'**
  String get fieldCategoryOptional;

  /// No description provided for @fieldDescriptionOptional.
  ///
  /// In en, this message translates to:
  /// **'Description (optional)'**
  String get fieldDescriptionOptional;

  /// No description provided for @categoryNone.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get categoryNone;

  /// No description provided for @categoryMeeting.
  ///
  /// In en, this message translates to:
  /// **'Meeting'**
  String get categoryMeeting;

  /// No description provided for @categoryPersonal.
  ///
  /// In en, this message translates to:
  /// **'Personal'**
  String get categoryPersonal;

  /// No description provided for @categoryDeadline.
  ///
  /// In en, this message translates to:
  /// **'Deadline'**
  String get categoryDeadline;

  /// No description provided for @categoryHealth.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get categoryHealth;

  /// No description provided for @categoryOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get categoryOther;

  /// No description provided for @actionUpdate.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get actionUpdate;

  /// No description provided for @actionCreate.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get actionCreate;

  /// No description provided for @actionToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get actionToday;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @eventsCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 event} other{{count} events}}'**
  String eventsCount(int count);

  /// No description provided for @jumpToDateTitle.
  ///
  /// In en, this message translates to:
  /// **'Jump to Date'**
  String get jumpToDateTitle;

  /// No description provided for @jumpToDateHint.
  ///
  /// In en, this message translates to:
  /// **'Select a date'**
  String get jumpToDateHint;

  /// No description provided for @actionGo.
  ///
  /// In en, this message translates to:
  /// **'Go'**
  String get actionGo;

  /// No description provided for @actionSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get actionSave;

  /// No description provided for @filterDay.
  ///
  /// In en, this message translates to:
  /// **'Day'**
  String get filterDay;

  /// No description provided for @filterWeek.
  ///
  /// In en, this message translates to:
  /// **'Week'**
  String get filterWeek;

  /// No description provided for @filterMonth.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get filterMonth;

  /// No description provided for @filterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get filterAll;

  /// No description provided for @calendarAllEvents.
  ///
  /// In en, this message translates to:
  /// **'All Events'**
  String get calendarAllEvents;

  /// No description provided for @settingsCalendar.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get settingsCalendar;

  /// No description provided for @settingsPrimaryCalendar.
  ///
  /// In en, this message translates to:
  /// **'Primary Calendar'**
  String get settingsPrimaryCalendar;

  /// No description provided for @settingsPrimaryCalendarEthiopian.
  ///
  /// In en, this message translates to:
  /// **'Ethiopian'**
  String get settingsPrimaryCalendarEthiopian;

  /// No description provided for @settingsPrimaryCalendarGregorian.
  ///
  /// In en, this message translates to:
  /// **'Gregorian'**
  String get settingsPrimaryCalendarGregorian;

  /// No description provided for @settingsPrimaryCalendarDual.
  ///
  /// In en, this message translates to:
  /// **'Dual'**
  String get settingsPrimaryCalendarDual;

  /// No description provided for @settingsWeekStart.
  ///
  /// In en, this message translates to:
  /// **'Week Start'**
  String get settingsWeekStart;

  /// No description provided for @settingsWeekStartSaturday.
  ///
  /// In en, this message translates to:
  /// **'Saturday'**
  String get settingsWeekStartSaturday;

  /// No description provided for @settingsWeekStartSunday.
  ///
  /// In en, this message translates to:
  /// **'Sunday'**
  String get settingsWeekStartSunday;

  /// No description provided for @settingsWeekStartMonday.
  ///
  /// In en, this message translates to:
  /// **'Monday'**
  String get settingsWeekStartMonday;

  /// No description provided for @settingsNumeralStyle.
  ///
  /// In en, this message translates to:
  /// **'Numeral Style'**
  String get settingsNumeralStyle;

  /// No description provided for @settingsNumeralGez.
  ///
  /// In en, this message translates to:
  /// **'Ge\'ez'**
  String get settingsNumeralGez;

  /// No description provided for @settingsNumeralLatin.
  ///
  /// In en, this message translates to:
  /// **'Latin'**
  String get settingsNumeralLatin;

  /// No description provided for @settingsTimezone.
  ///
  /// In en, this message translates to:
  /// **'Timezone'**
  String get settingsTimezone;

  /// No description provided for @settingsTimezoneAddisAbaba.
  ///
  /// In en, this message translates to:
  /// **'Addis Ababa'**
  String get settingsTimezoneAddisAbaba;

  /// No description provided for @settingsTimezoneGMT.
  ///
  /// In en, this message translates to:
  /// **'GMT'**
  String get settingsTimezoneGMT;

  /// No description provided for @onboardingLanguageTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose your language'**
  String get onboardingLanguageTitle;

  /// No description provided for @onboardingLanguageBody.
  ///
  /// In en, this message translates to:
  /// **'Select your preferred language. You can change this later in Settings.'**
  String get onboardingLanguageBody;

  /// No description provided for @onboardingIntroBody.
  ///
  /// In en, this message translates to:
  /// **'A personal planner with dual Ethiopian and Gregorian calendars, offline reminders and notes. Your data stays on your device.'**
  String get onboardingIntroBody;

  /// No description provided for @onboardingGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get onboardingGetStarted;

  /// No description provided for @onboardingAccountTitle.
  ///
  /// In en, this message translates to:
  /// **'Continue planning'**
  String get onboardingAccountTitle;

  /// No description provided for @onboardingAccountBody.
  ///
  /// In en, this message translates to:
  /// **'Create an account to back up your data and sync across devices, or continue as a guest.'**
  String get onboardingAccountBody;

  /// No description provided for @onboardingContinueGuest.
  ///
  /// In en, this message translates to:
  /// **'Continue as Guest'**
  String get onboardingContinueGuest;

  /// No description provided for @onboardingCreateAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get onboardingCreateAccount;

  /// No description provided for @onboardingSignIn.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? Sign in'**
  String get onboardingSignIn;

  /// No description provided for @onboardingGuestTitle.
  ///
  /// In en, this message translates to:
  /// **'Your data stays here'**
  String get onboardingGuestTitle;

  /// No description provided for @onboardingGuestBody.
  ///
  /// In en, this message translates to:
  /// **'Guest data is stored only on this device. It is not backed up and may be lost if you uninstall the app. You can import your data after creating an account later.'**
  String get onboardingGuestBody;

  /// No description provided for @onboardingGotIt.
  ///
  /// In en, this message translates to:
  /// **'Got it'**
  String get onboardingGotIt;

  /// No description provided for @recurrenceTitle.
  ///
  /// In en, this message translates to:
  /// **'Repeat Pattern'**
  String get recurrenceTitle;

  /// No description provided for @recurrenceFrequency.
  ///
  /// In en, this message translates to:
  /// **'Frequency'**
  String get recurrenceFrequency;

  /// No description provided for @recurrenceFreqDaily.
  ///
  /// In en, this message translates to:
  /// **'Daily'**
  String get recurrenceFreqDaily;

  /// No description provided for @recurrenceFreqWeekly.
  ///
  /// In en, this message translates to:
  /// **'Weekly'**
  String get recurrenceFreqWeekly;

  /// No description provided for @recurrenceFreqMonthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get recurrenceFreqMonthly;

  /// No description provided for @recurrenceFreqYearly.
  ///
  /// In en, this message translates to:
  /// **'Yearly'**
  String get recurrenceFreqYearly;

  /// No description provided for @recurrenceInterval.
  ///
  /// In en, this message translates to:
  /// **'Repeat every'**
  String get recurrenceInterval;

  /// No description provided for @recurrenceDay.
  ///
  /// In en, this message translates to:
  /// **'day'**
  String get recurrenceDay;

  /// No description provided for @recurrenceDays.
  ///
  /// In en, this message translates to:
  /// **'days'**
  String get recurrenceDays;

  /// No description provided for @recurrenceWeek.
  ///
  /// In en, this message translates to:
  /// **'week'**
  String get recurrenceWeek;

  /// No description provided for @recurrenceWeeks.
  ///
  /// In en, this message translates to:
  /// **'weeks'**
  String get recurrenceWeeks;

  /// No description provided for @recurrenceMonth.
  ///
  /// In en, this message translates to:
  /// **'month'**
  String get recurrenceMonth;

  /// No description provided for @recurrenceMonths.
  ///
  /// In en, this message translates to:
  /// **'months'**
  String get recurrenceMonths;

  /// No description provided for @recurrenceYear.
  ///
  /// In en, this message translates to:
  /// **'year'**
  String get recurrenceYear;

  /// No description provided for @recurrenceYears.
  ///
  /// In en, this message translates to:
  /// **'years'**
  String get recurrenceYears;

  /// No description provided for @recurrenceCalendarBasis.
  ///
  /// In en, this message translates to:
  /// **'Calendar basis'**
  String get recurrenceCalendarBasis;

  /// No description provided for @calendarBasisEthiopian.
  ///
  /// In en, this message translates to:
  /// **'Ethiopian'**
  String get calendarBasisEthiopian;

  /// No description provided for @calendarBasisGregorian.
  ///
  /// In en, this message translates to:
  /// **'Gregorian'**
  String get calendarBasisGregorian;

  /// No description provided for @recurrenceEnd.
  ///
  /// In en, this message translates to:
  /// **'Ends'**
  String get recurrenceEnd;

  /// No description provided for @recurrenceEndNever.
  ///
  /// In en, this message translates to:
  /// **'Never'**
  String get recurrenceEndNever;

  /// No description provided for @recurrenceEndAfter.
  ///
  /// In en, this message translates to:
  /// **'After'**
  String get recurrenceEndAfter;

  /// No description provided for @recurrenceOccurrences.
  ///
  /// In en, this message translates to:
  /// **'occurrences'**
  String get recurrenceOccurrences;

  /// No description provided for @recurrenceEndOnDate.
  ///
  /// In en, this message translates to:
  /// **'On date'**
  String get recurrenceEndOnDate;

  /// No description provided for @recurrencePreview.
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get recurrencePreview;

  /// No description provided for @recurrenceNone.
  ///
  /// In en, this message translates to:
  /// **'No repeat'**
  String get recurrenceNone;

  /// No description provided for @recurrenceClear.
  ///
  /// In en, this message translates to:
  /// **'Remove repeat'**
  String get recurrenceClear;

  /// No description provided for @settingsContentPacks.
  ///
  /// In en, this message translates to:
  /// **'Content Packs'**
  String get settingsContentPacks;

  /// No description provided for @settingsEthiopianHolidays.
  ///
  /// In en, this message translates to:
  /// **'Ethiopian Holidays'**
  String get settingsEthiopianHolidays;

  /// No description provided for @settingsEthiopianObservances.
  ///
  /// In en, this message translates to:
  /// **'Ethiopian Observances'**
  String get settingsEthiopianObservances;

  /// No description provided for @settingsEnabled.
  ///
  /// In en, this message translates to:
  /// **'Enabled'**
  String get settingsEnabled;

  /// No description provided for @settingsDisabled.
  ///
  /// In en, this message translates to:
  /// **'Disabled'**
  String get settingsDisabled;

  /// No description provided for @editOccurrenceTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Recurring Event'**
  String get editOccurrenceTitle;

  /// No description provided for @editOccurrenceMessage.
  ///
  /// In en, this message translates to:
  /// **'Do you want to edit only this occurrence, or all occurrences in the series?'**
  String get editOccurrenceMessage;

  /// No description provided for @editThisOccurrence.
  ///
  /// In en, this message translates to:
  /// **'This Occurrence'**
  String get editThisOccurrence;

  /// No description provided for @editAllOccurrences.
  ///
  /// In en, this message translates to:
  /// **'All Occurrences'**
  String get editAllOccurrences;

  /// No description provided for @deleteOccurrenceTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Recurring Event'**
  String get deleteOccurrenceTitle;

  /// No description provided for @deleteOccurrenceMessage.
  ///
  /// In en, this message translates to:
  /// **'Do you want to delete only this occurrence, or all occurrences in the series?'**
  String get deleteOccurrenceMessage;

  /// No description provided for @deleteThisOccurrence.
  ///
  /// In en, this message translates to:
  /// **'This Occurrence'**
  String get deleteThisOccurrence;

  /// No description provided for @deleteAllOccurrences.
  ///
  /// In en, this message translates to:
  /// **'All Occurrences'**
  String get deleteAllOccurrences;

  /// No description provided for @snoozeReminder.
  ///
  /// In en, this message translates to:
  /// **'Snooze Reminder'**
  String get snoozeReminder;

  /// No description provided for @snooze15Minutes.
  ///
  /// In en, this message translates to:
  /// **'15 minutes'**
  String get snooze15Minutes;

  /// No description provided for @snooze30Minutes.
  ///
  /// In en, this message translates to:
  /// **'30 minutes'**
  String get snooze30Minutes;

  /// No description provided for @snooze1Hour.
  ///
  /// In en, this message translates to:
  /// **'1 hour'**
  String get snooze1Hour;

  /// No description provided for @snooze2Hours.
  ///
  /// In en, this message translates to:
  /// **'2 hours'**
  String get snooze2Hours;

  /// No description provided for @snoozeTomorrow.
  ///
  /// In en, this message translates to:
  /// **'Snooze until tomorrow (9 AM)'**
  String get snoozeTomorrow;

  /// No description provided for @skipOccurrence.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skipOccurrence;

  /// No description provided for @skipConfirmation.
  ///
  /// In en, this message translates to:
  /// **'This occurrence will be skipped. Other occurrences in the series are not affected.'**
  String get skipConfirmation;

  /// No description provided for @linkToEvent.
  ///
  /// In en, this message translates to:
  /// **'Link Event'**
  String get linkToEvent;

  /// No description provided for @linkToReminder.
  ///
  /// In en, this message translates to:
  /// **'Link Reminder'**
  String get linkToReminder;

  /// No description provided for @linkToPlanner.
  ///
  /// In en, this message translates to:
  /// **'Link Planner'**
  String get linkToPlanner;

  /// No description provided for @noItemsToLink.
  ///
  /// In en, this message translates to:
  /// **'No items available to link. Create some first.'**
  String get noItemsToLink;

  /// No description provided for @reminderSnooze.
  ///
  /// In en, this message translates to:
  /// **'Snooze'**
  String get reminderSnooze;

  /// No description provided for @reminderSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get reminderSkip;

  /// No description provided for @reminderCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel Reminder'**
  String get reminderCancel;

  /// No description provided for @plannerDay.
  ///
  /// In en, this message translates to:
  /// **'Day'**
  String get plannerDay;

  /// No description provided for @plannerWeek.
  ///
  /// In en, this message translates to:
  /// **'Week'**
  String get plannerWeek;

  /// No description provided for @plannerMonth.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get plannerMonth;

  /// No description provided for @plannerYear.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get plannerYear;

  /// No description provided for @plannerSectionFocus.
  ///
  /// In en, this message translates to:
  /// **'Focus'**
  String get plannerSectionFocus;

  /// No description provided for @plannerSectionPriorities.
  ///
  /// In en, this message translates to:
  /// **'Priorities'**
  String get plannerSectionPriorities;

  /// No description provided for @plannerSectionChecklist.
  ///
  /// In en, this message translates to:
  /// **'Checklist'**
  String get plannerSectionChecklist;

  /// No description provided for @plannerSectionNotes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get plannerSectionNotes;

  /// No description provided for @plannerSectionReflection.
  ///
  /// In en, this message translates to:
  /// **'Reflection'**
  String get plannerSectionReflection;

  /// No description provided for @plannerSectionFocusEmpty.
  ///
  /// In en, this message translates to:
  /// **'What\'s your main focus today?'**
  String get plannerSectionFocusEmpty;

  /// No description provided for @plannerSectionPrioritiesEmpty.
  ///
  /// In en, this message translates to:
  /// **'Add your top priorities'**
  String get plannerSectionPrioritiesEmpty;

  /// No description provided for @plannerSectionChecklistEmpty.
  ///
  /// In en, this message translates to:
  /// **'Add tasks to check off'**
  String get plannerSectionChecklistEmpty;

  /// No description provided for @plannerSectionNotesEmpty.
  ///
  /// In en, this message translates to:
  /// **'Add notes for this period'**
  String get plannerSectionNotesEmpty;

  /// No description provided for @plannerSectionReflectionEmpty.
  ///
  /// In en, this message translates to:
  /// **'Reflect on your progress'**
  String get plannerSectionReflectionEmpty;

  /// No description provided for @copyFromPreviousTitle.
  ///
  /// In en, this message translates to:
  /// **'Copy from Previous'**
  String get copyFromPreviousTitle;

  /// No description provided for @copyFromPreviousMessage.
  ///
  /// In en, this message translates to:
  /// **'Copy all items from the previous {period} to today? Duplicates will be skipped.'**
  String copyFromPreviousMessage(Object period);

  /// No description provided for @carryForwardTitle.
  ///
  /// In en, this message translates to:
  /// **'Carry Forward'**
  String get carryForwardTitle;

  /// No description provided for @carryForwardMessage.
  ///
  /// In en, this message translates to:
  /// **'Carry forward incomplete items from the previous {period}? Duplicates will be skipped.'**
  String carryForwardMessage(Object period);

  /// No description provided for @copiedItems.
  ///
  /// In en, this message translates to:
  /// **'{count} item(s) copied'**
  String copiedItems(Object count);

  /// No description provided for @carriedItems.
  ///
  /// In en, this message translates to:
  /// **'{count} item(s) carried forward'**
  String carriedItems(Object count);

  /// No description provided for @nothingToCopy.
  ///
  /// In en, this message translates to:
  /// **'Nothing to copy from the previous period'**
  String get nothingToCopy;

  /// No description provided for @nothingToCarry.
  ///
  /// In en, this message translates to:
  /// **'No incomplete items to carry forward'**
  String get nothingToCarry;

  /// No description provided for @recentlyDeletedConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Permanently delete?'**
  String get recentlyDeletedConfirmTitle;

  /// No description provided for @recentlyDeletedConfirmBody.
  ///
  /// In en, this message translates to:
  /// **'\"{title}\" will be permanently deleted. This cannot be undone.'**
  String recentlyDeletedConfirmBody(Object title);

  /// No description provided for @recentlyDeletedFilterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get recentlyDeletedFilterAll;

  /// No description provided for @recentlyDeletedFilterEvents.
  ///
  /// In en, this message translates to:
  /// **'Events'**
  String get recentlyDeletedFilterEvents;

  /// No description provided for @recentlyDeletedFilterReminders.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get recentlyDeletedFilterReminders;

  /// No description provided for @recentlyDeletedFilterPlanner.
  ///
  /// In en, this message translates to:
  /// **'Planner'**
  String get recentlyDeletedFilterPlanner;

  /// No description provided for @recentlyDeletedFilterNotes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get recentlyDeletedFilterNotes;

  /// No description provided for @recentlyDeletedDeletedOn.
  ///
  /// In en, this message translates to:
  /// **'Deleted {date}'**
  String recentlyDeletedDeletedOn(Object date);

  /// No description provided for @revisionHistory.
  ///
  /// In en, this message translates to:
  /// **'Revision History'**
  String get revisionHistory;

  /// No description provided for @restoreRevisionTitle.
  ///
  /// In en, this message translates to:
  /// **'Restore this version?'**
  String get restoreRevisionTitle;

  /// No description provided for @restoreRevisionBody.
  ///
  /// In en, this message translates to:
  /// **'This will replace the current note content with this version.'**
  String get restoreRevisionBody;

  /// No description provided for @revisionRestored.
  ///
  /// In en, this message translates to:
  /// **'Revision restored'**
  String get revisionRestored;

  /// No description provided for @notificationPermissionTitle.
  ///
  /// In en, this message translates to:
  /// **'Notification Permission'**
  String get notificationPermissionTitle;

  /// No description provided for @notificationPermissionBody.
  ///
  /// In en, this message translates to:
  /// **'Allow notifications to receive reminders on time.'**
  String get notificationPermissionBody;

  /// No description provided for @notificationPermissionOK.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get notificationPermissionOK;

  /// No description provided for @plannerManageSections.
  ///
  /// In en, this message translates to:
  /// **'Manage sections'**
  String get plannerManageSections;

  /// No description provided for @searchCategoryHint.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get searchCategoryHint;

  /// No description provided for @syncTitle.
  ///
  /// In en, this message translates to:
  /// **'Sync Data'**
  String get syncTitle;

  /// No description provided for @syncClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get syncClose;

  /// No description provided for @syncImportGuest.
  ///
  /// In en, this message translates to:
  /// **'Import Guest Data'**
  String get syncImportGuest;

  /// No description provided for @syncNow.
  ///
  /// In en, this message translates to:
  /// **'Sync Now'**
  String get syncNow;

  /// No description provided for @syncReady.
  ///
  /// In en, this message translates to:
  /// **'Ready to sync'**
  String get syncReady;

  /// No description provided for @syncComplete.
  ///
  /// In en, this message translates to:
  /// **'Sync complete'**
  String get syncComplete;

  /// No description provided for @syncConflicts.
  ///
  /// In en, this message translates to:
  /// **'Conflicts detected'**
  String get syncConflicts;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @deleteNoteConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete note?'**
  String get deleteNoteConfirmTitle;

  /// No description provided for @deleteNoteConfirmBody.
  ///
  /// In en, this message translates to:
  /// **'\"{title}\" will be permanently deleted.'**
  String deleteNoteConfirmBody(Object title);

  /// No description provided for @deleteNoteConfirmDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get deleteNoteConfirmDelete;

  /// No description provided for @searchAcrossData.
  ///
  /// In en, this message translates to:
  /// **'Search across your data'**
  String get searchAcrossData;

  /// No description provided for @searchNoResults.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get searchNoResults;

  /// No description provided for @searchTryDifferent.
  ///
  /// In en, this message translates to:
  /// **'Try a different search term'**
  String get searchTryDifferent;

  /// No description provided for @searchResultsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} results'**
  String searchResultsCount(Object count);

  /// No description provided for @searchFilterTypes.
  ///
  /// In en, this message translates to:
  /// **'Filter by type'**
  String get searchFilterTypes;

  /// No description provided for @searchFilterDateRange.
  ///
  /// In en, this message translates to:
  /// **'Date range'**
  String get searchFilterDateRange;

  /// No description provided for @searchFilterCategory.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get searchFilterCategory;

  /// No description provided for @searchClearFilters.
  ///
  /// In en, this message translates to:
  /// **'Clear filters'**
  String get searchClearFilters;

  /// No description provided for @searchAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get searchAll;

  /// No description provided for @searchCategoryWork.
  ///
  /// In en, this message translates to:
  /// **'Work'**
  String get searchCategoryWork;

  /// No description provided for @searchCategoryPersonal.
  ///
  /// In en, this message translates to:
  /// **'Personal'**
  String get searchCategoryPersonal;

  /// No description provided for @searchCategoryOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get searchCategoryOther;

  /// No description provided for @searchTypeEvents.
  ///
  /// In en, this message translates to:
  /// **'Events'**
  String get searchTypeEvents;

  /// No description provided for @searchTypeReminders.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get searchTypeReminders;

  /// No description provided for @searchTypePlanner.
  ///
  /// In en, this message translates to:
  /// **'Planner'**
  String get searchTypePlanner;

  /// No description provided for @searchTypeNotes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get searchTypeNotes;

  /// No description provided for @recentlyDeletedTab.
  ///
  /// In en, this message translates to:
  /// **'Recently Deleted'**
  String get recentlyDeletedTab;

  /// No description provided for @pin.
  ///
  /// In en, this message translates to:
  /// **'Pin'**
  String get pin;

  /// No description provided for @unpin.
  ///
  /// In en, this message translates to:
  /// **'Unpin'**
  String get unpin;

  /// No description provided for @archive.
  ///
  /// In en, this message translates to:
  /// **'Archive'**
  String get archive;

  /// No description provided for @unarchive.
  ///
  /// In en, this message translates to:
  /// **'Unarchive'**
  String get unarchive;

  /// No description provided for @viewHistory.
  ///
  /// In en, this message translates to:
  /// **'View History'**
  String get viewHistory;

  /// No description provided for @plannerItem.
  ///
  /// In en, this message translates to:
  /// **'Planner Item'**
  String get plannerItem;

  /// No description provided for @plannerGoToToday.
  ///
  /// In en, this message translates to:
  /// **'Go to today'**
  String get plannerGoToToday;

  /// No description provided for @healthCategory.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get healthCategory;

  /// No description provided for @onboardingSystemLanguage.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get onboardingSystemLanguage;

  /// No description provided for @navigationPrevious.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get navigationPrevious;

  /// No description provided for @navigationNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get navigationNext;

  /// No description provided for @currentPeriod.
  ///
  /// In en, this message translates to:
  /// **'Current'**
  String get currentPeriod;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @clearSearch.
  ///
  /// In en, this message translates to:
  /// **'Clear search'**
  String get clearSearch;

  /// No description provided for @expandFilters.
  ///
  /// In en, this message translates to:
  /// **'Expand filters'**
  String get expandFilters;

  /// No description provided for @collapseFilters.
  ///
  /// In en, this message translates to:
  /// **'Collapse filters'**
  String get collapseFilters;

  /// No description provided for @dateConverterTitle.
  ///
  /// In en, this message translates to:
  /// **'Date Converter'**
  String get dateConverterTitle;

  /// No description provided for @dateConverterSwap.
  ///
  /// In en, this message translates to:
  /// **'Swap direction'**
  String get dateConverterSwap;

  /// No description provided for @dateConverterEthiopianDate.
  ///
  /// In en, this message translates to:
  /// **'Ethiopian Date'**
  String get dateConverterEthiopianDate;

  /// No description provided for @dateConverterGregorianDate.
  ///
  /// In en, this message translates to:
  /// **'Gregorian Date'**
  String get dateConverterGregorianDate;

  /// No description provided for @dateConverterYear.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get dateConverterYear;

  /// No description provided for @dateConverterMonth.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get dateConverterMonth;

  /// No description provided for @dateConverterDay.
  ///
  /// In en, this message translates to:
  /// **'Day'**
  String get dateConverterDay;

  /// No description provided for @dateConverterConvert.
  ///
  /// In en, this message translates to:
  /// **'Convert'**
  String get dateConverterConvert;

  /// No description provided for @dateConverterResult.
  ///
  /// In en, this message translates to:
  /// **'Result'**
  String get dateConverterResult;

  /// No description provided for @moreDateConverter.
  ///
  /// In en, this message translates to:
  /// **'Date Converter'**
  String get moreDateConverter;

  /// No description provided for @dailyQuoteTitle.
  ///
  /// In en, this message translates to:
  /// **'Daily Inspiration'**
  String get dailyQuoteTitle;

  /// No description provided for @sectionNotes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get sectionNotes;

  /// No description provided for @notesMoreCount.
  ///
  /// In en, this message translates to:
  /// **'+{count} more notes'**
  String notesMoreCount(int count);

  /// No description provided for @complete.
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get complete;

  /// No description provided for @snoozeOneHour.
  ///
  /// In en, this message translates to:
  /// **'Snooze for 1 hour'**
  String get snoozeOneHour;

  /// No description provided for @tapToView.
  ///
  /// In en, this message translates to:
  /// **'Tap to view details'**
  String get tapToView;

  /// No description provided for @planningStreakTooltip.
  ///
  /// In en, this message translates to:
  /// **'{count}-day planning streak'**
  String planningStreakTooltip(int count);

  /// No description provided for @quickAddLastUsed.
  ///
  /// In en, this message translates to:
  /// **'Last used: {type}'**
  String quickAddLastUsed(String type);

  /// No description provided for @eventTypeMeeting.
  ///
  /// In en, this message translates to:
  /// **'Meeting'**
  String get eventTypeMeeting;

  /// No description provided for @eventTypePersonal.
  ///
  /// In en, this message translates to:
  /// **'Personal'**
  String get eventTypePersonal;

  /// No description provided for @eventTypeDeadline.
  ///
  /// In en, this message translates to:
  /// **'Deadline'**
  String get eventTypeDeadline;

  /// No description provided for @eventTypeHealth.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get eventTypeHealth;

  /// No description provided for @eventTypeOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get eventTypeOther;

  /// No description provided for @settingsNotificationSound.
  ///
  /// In en, this message translates to:
  /// **'Notification Sound'**
  String get settingsNotificationSound;

  /// No description provided for @notificationSoundSystem.
  ///
  /// In en, this message translates to:
  /// **'System Default'**
  String get notificationSoundSystem;

  /// No description provided for @notificationSoundSystemDesc.
  ///
  /// In en, this message translates to:
  /// **'Use your device\'s default notification sound'**
  String get notificationSoundSystemDesc;

  /// No description provided for @notificationSoundEthiopianBell.
  ///
  /// In en, this message translates to:
  /// **'Ethiopian Bell'**
  String get notificationSoundEthiopianBell;

  /// No description provided for @notificationSoundGentleChime.
  ///
  /// In en, this message translates to:
  /// **'Gentle Chime'**
  String get notificationSoundGentleChime;

  /// No description provided for @notificationSoundSoftPing.
  ///
  /// In en, this message translates to:
  /// **'Soft Ping'**
  String get notificationSoundSoftPing;

  /// No description provided for @notificationSoundWarmTone.
  ///
  /// In en, this message translates to:
  /// **'Warm Tone'**
  String get notificationSoundWarmTone;

  /// No description provided for @notificationSoundCustomDesc.
  ///
  /// In en, this message translates to:
  /// **'Custom notification sound'**
  String get notificationSoundCustomDesc;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['am', 'en', 'om', 'ti'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'am':
      return AppLocalizationsAm();
    case 'en':
      return AppLocalizationsEn();
    case 'om':
      return AppLocalizationsOm();
    case 'ti':
      return AppLocalizationsTi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
