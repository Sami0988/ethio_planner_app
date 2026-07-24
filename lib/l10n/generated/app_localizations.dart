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
  String recentlyDeletedDaysLeft(Object count);

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
  /// **'Try a different search term'**
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

  /// No description provided for @categoryWork.
  ///
  /// In en, this message translates to:
  /// **'Work'**
  String get categoryWork;

  /// No description provided for @categoryPersonal.
  ///
  /// In en, this message translates to:
  /// **'Personal'**
  String get categoryPersonal;

  /// No description provided for @categoryHoliday.
  ///
  /// In en, this message translates to:
  /// **'Holiday'**
  String get categoryHoliday;

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
